import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom/src/features/auth/auth.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> signIn();
  Future<void> signOut();
  Stream<User?> authStateChanges();
}
