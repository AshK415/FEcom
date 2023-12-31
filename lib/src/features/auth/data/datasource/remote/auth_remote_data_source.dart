import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom/src/features/common/common.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/auth_result.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResult> googleSignIn();
  Future<void> googleSignOut(int id);
  Stream<User?> authStateChanges();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final UserRepository userRepository;

  const AuthRemoteDataSourceImpl(
      {required this.firebaseAuth,
      required this.firestore,
      required this.userRepository});

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
      // Save the user in database
      userRepository.setCurrentUser(UserEntity(
          uid: result.user!.uid,
          email: result.user!.email!,
          displayName: result.user!.displayName!,
          updatedAt: DateTime.now().millisecondsSinceEpoch));

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
  Future<void> googleSignOut(int id) async {
    await firebaseAuth.signOut();
    //userRepository.deleteUser(id);
    await GoogleSignIn().signOut();
  }

  CollectionReference _usersCollectionRef() {
    return firestore.collection(
      FirebaseCollectionName.users,
    );
  }
}
