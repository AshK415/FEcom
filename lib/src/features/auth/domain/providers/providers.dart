import 'package:flutter_ecom/src/features/auth/auth.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
AuthRemoteDataSource auth(AuthRef ref) => AuthRemoteDataSourceImpl(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider));

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepositoryImpl(authRemoteDataSource: ref.watch(authProvider));
