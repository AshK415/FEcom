import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:flutter_ecom/src/shared/theme/app_theme_mode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

/// Top level providers initialization
@riverpod
Future<SharedPreferences> sharedPreference(SharedPreferenceRef ref) =>
    SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
Future<ObjectBoxService> objectBoxService(ObjectBoxServiceRef ref) =>
    ObjectBoxService.init();

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) => FirebaseAuth.instance;

@Riverpod(keepAlive: true)
FirebaseFirestore firestore(FirestoreRef ref) => FirebaseFirestore.instance;

@riverpod
UserService userService(UserServiceRef ref) => UserService();

// @Riverpod(keepAlive: true)
// Stream<ConnectivityResult> networkState(NetworkStateRef ref) =>
//     Connectivity().onConnectivityChanged;

// final sharedPreferencesProvider =
//     FutureProvider((ref) => SharedPreferences.getInstance());

Future<void> initProviders(ProviderContainer container) async {
  await container.read(sharedPreferenceProvider.future);
  await container.read(objectBoxServiceProvider.future);
  await container.read(networkStateProvider.future);
  container.read(appThemeModeProvider);

  /// Auth
  //container.read(authControllerProvider);
}
