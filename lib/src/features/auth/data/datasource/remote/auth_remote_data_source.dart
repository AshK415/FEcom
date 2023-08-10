import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/auth_result.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResult> googleSignIn();
  Future<void> googleSignOut();
  Stream<User?> authStateChanges();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  const AuthRemoteDataSourceImpl(
      {required this.firebaseAuth, required this.firestore});

  @override
  Stream<User?> authStateChanges() async* {
    yield* firebaseAuth.authStateChanges();
  }

  @override
  Future<AuthResult> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      AppKeys.emailScope,
    ]);
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }

    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    try {
      final result = await FirebaseAuth.instance.signInWithCredential(
        oauthCredentials,
      );

      await _usersCollectionRef().doc(result.user?.uid).set({
        FirebaseFieldName.displayName: result.user?.displayName,
        FirebaseFieldName.email: result.user?.email,
        FirebaseFieldName.userId: result.user?.uid,
        FirebaseFieldName.imageUrl: result.user?.photoURL,
      });

      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }

  @override
  Future<void> googleSignOut() async {
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  CollectionReference _usersCollectionRef() {
    return firestore.collection(
      FirebaseCollectionName.users,
    );
  }
}
