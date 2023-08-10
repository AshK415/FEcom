// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBznvRDbD4O21YkrFRE4Cy8XKpthTRW-LE',
    appId: '1:588946810429:web:1dd428d1719a1f2e122c54',
    messagingSenderId: '588946810429',
    projectId: 'f-ecom',
    authDomain: 'f-ecom.firebaseapp.com',
    storageBucket: 'f-ecom.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCo_Wr4aZuszEAwMEEHWu9gmGhbZHlbFkM',
    appId: '1:588946810429:android:3d47b622a9dc69c0122c54',
    messagingSenderId: '588946810429',
    projectId: 'f-ecom',
    storageBucket: 'f-ecom.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBu_mvxbZZdN1WZg6arEw0Z-1CuowTRDrA',
    appId: '1:588946810429:ios:0ebcc7e801287a27122c54',
    messagingSenderId: '588946810429',
    projectId: 'f-ecom',
    storageBucket: 'f-ecom.appspot.com',
    iosClientId: '588946810429-8bqc7irj2faf0gtoaa8qu4bcgrnp6usf.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEcom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBu_mvxbZZdN1WZg6arEw0Z-1CuowTRDrA',
    appId: '1:588946810429:ios:7d40dcb942d32e62122c54',
    messagingSenderId: '588946810429',
    projectId: 'f-ecom',
    storageBucket: 'f-ecom.appspot.com',
    iosClientId: '588946810429-rge1css7nm92fleero9lb1ikldmhu1s7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEcom.RunnerTests',
  );
}
