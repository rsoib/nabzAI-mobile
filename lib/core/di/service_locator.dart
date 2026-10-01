import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../config/app_config.dart';
import '../network/api_client.dart';
import '../storage/local_flags_store.dart';
import '../storage/secure_token_storage.dart';
import '../theme/theme_controller.dart';
import '../push/push_service.dart';
import '../../features/activity/data/activity_repository.dart';
import '../../features/auth/data/auth_repository.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/complaints/data/complaints_repository.dart';
import '../../features/labs/data/labs_repository.dart';
import '../../features/medcard/data/medcard_repository.dart';
import '../../features/profile/data/profile_repository.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../../features/push/data/push_tokens_repository.dart';
import '../../features/sharing/data/sharing_repository.dart';

final GetIt getIt = GetIt.instance;

/// Registers app-wide singletons. Call once during bootstrap, after
/// [AppConfig.init]. Feature modules add their own repository/cubit
/// factories here as they're built (see each feature's `di` registration
/// call, invoked from this function).
Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<SecureTokenStorage>(() => SecureTokenStorage());
  getIt.registerLazySingleton<LocalFlagsStore>(() => LocalFlagsStore());

  getIt.registerLazySingleton<Dio>(
    () => ApiClient.create(config: AppConfig.instance, tokenStorage: getIt<SecureTokenStorage>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(dio: getIt<Dio>(), tokenStorage: getIt<SecureTokenStorage>()),
  );

  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(authRepository: getIt<AuthRepository>(), tokenStorage: getIt<SecureTokenStorage>()),
  );

  getIt.registerLazySingleton<ThemeController>(() => ThemeController());

  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository(dio: getIt<Dio>()));

  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(profileRepository: getIt<ProfileRepository>(), authCubit: getIt<AuthCubit>()),
  );

  getIt.registerLazySingleton<MedcardRepository>(() => MedcardRepository(dio: getIt<Dio>()));

  getIt.registerLazySingleton<LabsRepository>(() => LabsRepository(dio: getIt<Dio>()));

  getIt.registerLazySingleton<ComplaintsRepository>(() => ComplaintsRepository(dio: getIt<Dio>()));

  getIt.registerLazySingleton<ActivityRepository>(() => ActivityRepository(dio: getIt<Dio>()));

  getIt.registerLazySingleton<SharingRepository>(() => SharingRepository(dio: getIt<Dio>()));

  getIt.registerLazySingleton<PushTokensRepository>(() => PushTokensRepository(dio: getIt<Dio>()));

  getIt.registerLazySingleton<PushService>(
    () => PushService(repository: getIt<PushTokensRepository>(), authCubit: getIt<AuthCubit>()),
  );
  // PushService listens to AuthCubit's stream from its constructor, so it
  // must be instantiated eagerly, not left lazy until something reads it.
  getIt<PushService>();
}
