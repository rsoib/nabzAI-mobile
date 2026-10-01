import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../di/service_locator.dart';
import '../storage/local_flags_store.dart';
import '../theme/app_colors.dart';
import '../theme/theme_controller.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/cubit/auth_state.dart';
import '../../features/auth/presentation/phone_entry_screen.dart';
import '../../features/design_system/presentation/design_system_screen.dart';
import '../../features/activity/presentation/activity_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/home/presentation/main_shell_screen.dart';
import '../../features/labs/presentation/history/labs_list_screen.dart';
import '../../features/onboarding/presentation/onboarding_flow_screen.dart';
import '../../features/profile/data/models/patient_profile.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../../features/profile/presentation/cubit/profile_state.dart';
import '../../features/profile/presentation/onboarding/profile_wizard_screen.dart';
import '../../features/profile/presentation/settings/settings_screen.dart';
import 'bloc_listenable.dart';

/// Builds the single app-wide router. Call once at bootstrap and pass the
/// result into [NabzApp] — do not rebuild it on every theme change (that
/// would reset the navigation stack), see main_dev.dart.
GoRouter buildAppRouter() {
  final authCubit = getIt<AuthCubit>();
  final profileCubit = getIt<ProfileCubit>();
  final flagsStore = getIt<LocalFlagsStore>();

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: Listenable.merge([BlocListenable<AuthCubit>(authCubit), BlocListenable<ProfileCubit>(profileCubit)]),
    redirect: (context, state) async {
      final isSplash = state.matchedLocation == '/splash';
      final isOnboarding = state.matchedLocation == '/onboarding';
      final isPhoneFlow = state.matchedLocation == '/phone';
      final isProfileSetup = state.matchedLocation == '/profile-setup';

      switch (authCubit.state) {
        case AuthUnknown():
          return isSplash ? null : '/splash';

        case AuthUnauthenticated():
          final seenOnboarding = await flagsStore.hasSeenOnboarding();
          if (!seenOnboarding) {
            return isOnboarding ? null : '/onboarding';
          }
          return isPhoneFlow ? null : '/phone';

        case AuthAuthenticated():
          switch (profileCubit.state) {
            case ProfileInitial() || ProfileLoading():
              // Profile still loading — park on the spinner briefly.
              return isSplash ? null : '/splash';
            case ProfileError():
              // Couldn't load the profile (offline right after login) —
              // treat as incomplete rather than blocking the user forever.
              return isProfileSetup ? null : '/profile-setup';
            case ProfileLoaded(:final profile):
              if (!profile.isOnboardingComplete) {
                return isProfileSetup ? null : '/profile-setup';
              }
              return (isSplash || isOnboarding || isPhoneFlow || isProfileSetup) ? '/home' : null;
          }
      }
    },
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const _AuthBootstrapSpinner()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingFlowScreen(onFinished: () => context.go('/phone')),
      ),
      GoRoute(path: '/phone', builder: (context, state) => const PhoneEntryScreen()),
      GoRoute(
        path: '/profile-setup',
        builder: (context, state) => ProfileWizardScreen(onFinished: () => context.go('/home')),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainShellScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [GoRoute(path: '/home', builder: (context, state) => const HomeScreen())]),
          StatefulShellBranch(
            routes: [GoRoute(path: '/labs', builder: (context, state) => const LabsListScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/activity', builder: (context, state) => const ActivityScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/profile', builder: (context, state) => const SettingsScreen())],
          ),
        ],
      ),
      GoRoute(
        path: '/design-system',
        builder: (context, state) {
          final themeController = getIt<ThemeController>();
          return AnimatedBuilder(
            animation: themeController,
            builder: (context, _) => DesignSystemScreen(
              isDark: themeController.value == ThemeMode.dark,
              onToggleTheme: themeController.toggle,
            ),
          );
        },
      ),
    ],
  );
}

/// Shown only during the brief `AuthState.unknown` bootstrap check — not to
/// be confused with `SplashScreen`, the branded first-launch welcome screen
/// shown as part of `/onboarding`.
class _AuthBootstrapSpinner extends StatelessWidget {
  const _AuthBootstrapSpinner();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.background,
      body: Center(child: CircularProgressIndicator(color: colors.brand)),
    );
  }
}
