import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

/// Bottom navigation shell: 4 tabs max, per the design brief. Each tab keeps
/// its own navigation stack via [StatefulShellRoute.indexedStack] (see
/// app_router.dart) so switching tabs doesn't lose scroll position/state.
class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        backgroundColor: colors.surface,
        indicatorColor: colors.brandMuted,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) =>
            navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_rounded, color: colors.textSecondary),
            selectedIcon: Icon(Icons.home_rounded, color: colors.brand),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.science_rounded, color: colors.textSecondary),
            selectedIcon: Icon(Icons.science_rounded, color: colors.brand),
            label: 'Анализы',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_rounded, color: colors.textSecondary),
            selectedIcon: Icon(Icons.favorite_rounded, color: colors.brand),
            label: 'Активность',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded, color: colors.textSecondary),
            selectedIcon: Icon(Icons.person_rounded, color: colors.brand),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
