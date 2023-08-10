import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state/auth_state.dart';

part 'auth_notifier.g.dart';

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  final repo = ref.watch(authRepositoryProvider);
  return repo.authStateChanges();
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late AuthRepository authRepository;
  @override
  FutureOr<AuthState> build() {
    authRepository = ref.watch(authRepositoryProvider);
    return const AuthState.initial(AuthResult.none, false);
  }

  void googleSignIn() async {
    state = const AsyncLoading();
    final result = await authRepository.signIn();
    state = result.fold(
        (failure) => AsyncValue.data(
              state.value!
                  .copyWith(isLoading: false, authResult: AuthResult.failure),
            ),
        (authResult) =>
            AsyncValue.data(state.value!.copyWith(authResult: authResult)));
  }

  void signOut() async {
    state = const AsyncLoading();
    await authRepository.signOut().then((value) {
      state =
          AsyncValue.data(state.value!.copyWith(authResult: AuthResult.none));
    });
  }
}
