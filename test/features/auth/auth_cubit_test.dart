import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled2/core/storage/secure_token_storage.dart';
import 'package:untitled2/features/auth/data/auth_repository.dart';
import 'package:untitled2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:untitled2/features/auth/presentation/cubit/auth_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockSecureTokenStorage extends Mock implements SecureTokenStorage {}

void main() {
  late MockAuthRepository authRepository;
  late MockSecureTokenStorage tokenStorage;

  setUp(() {
    authRepository = MockAuthRepository();
    tokenStorage = MockSecureTokenStorage();
  });

  group('AuthCubit', () {
    blocTest<AuthCubit, AuthState>(
      'emits unauthenticated when no session exists on bootstrap',
      setUp: () => when(() => tokenStorage.hasSession()).thenAnswer((_) async => false),
      build: () => AuthCubit(authRepository: authRepository, tokenStorage: tokenStorage),
      expect: () => [const AuthState.unauthenticated()],
    );

    blocTest<AuthCubit, AuthState>(
      'emits authenticated when a session already exists on bootstrap',
      setUp: () => when(() => tokenStorage.hasSession()).thenAnswer((_) async => true),
      build: () => AuthCubit(authRepository: authRepository, tokenStorage: tokenStorage),
      expect: () => [const AuthState.authenticated()],
    );

    blocTest<AuthCubit, AuthState>(
      'notifyAuthenticated emits authenticated',
      setUp: () => when(() => tokenStorage.hasSession()).thenAnswer((_) async => false),
      build: () => AuthCubit(authRepository: authRepository, tokenStorage: tokenStorage),
      act: (cubit) => cubit.notifyAuthenticated(),
      skip: 1,
      expect: () => [const AuthState.authenticated()],
    );

    blocTest<AuthCubit, AuthState>(
      'logout calls the repository and emits unauthenticated',
      setUp: () {
        when(() => tokenStorage.hasSession()).thenAnswer((_) async => true);
        when(() => authRepository.logout()).thenAnswer((_) async {});
      },
      build: () => AuthCubit(authRepository: authRepository, tokenStorage: tokenStorage),
      act: (cubit) => cubit.logout(),
      skip: 1,
      expect: () => [const AuthState.unauthenticated()],
      verify: (_) => verify(() => authRepository.logout()).called(1),
    );
  });
}
