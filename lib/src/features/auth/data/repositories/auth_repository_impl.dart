import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom/src/features/auth/auth.dart';
import 'package:flutter_ecom/src/shared/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Stream<User?> authStateChanges() {
    try {
      return authRemoteDataSource.authStateChanges();
    } catch (e) {
      throw const Failure('User does not exist');
    }
  }

  @override
  Future<Either<Failure, AuthResult>> signIn() async {
    try {
      final result = await authRemoteDataSource.googleSignIn();
      return Right(result);
    } catch (e) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<void> signOut() async {
    return await authRemoteDataSource.googleSignOut();
  }
}
