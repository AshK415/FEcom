import 'package:flutter_ecom/src/app/state/app_start_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_start_provider.g.dart';

@riverpod
class AppStartNotifier extends _$AppStartNotifier {
  @override
  FutureOr<AppStartState> build() async {
    ref.onDispose(() {});
    //final _authState = ref.watch(authNotifierProvider);
    return const AppStartState.authenticated();
    // if (_authState is AuthStateLoggedIn) {
    //   return AppStartState.authenticated();
    // }

    // if (_authState is AuthStateLoggedOut) {
    //   return AppStartState.unauthenticated();
    // }

    // final token = await _tokenRepository.fetchToken();
    // if (token != null) {
    //   return const AppStartState.authenticated();
    // } else {
    //   return const AppStartState.unauthenticated();
    // }
  }
}
