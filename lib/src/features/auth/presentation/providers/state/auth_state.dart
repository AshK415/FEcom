import 'package:flutter_ecom/src/features/auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState(
      {required AuthResult authResult, required bool isLoading}) = _AuthState;

  const factory AuthState.initial(AuthResult authResult, bool isLoading) =
      _Initial;
}
