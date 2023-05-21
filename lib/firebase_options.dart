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
    apiKey: 'AIzaSyBr9coxWVJfhbzYdI2Q4cineh9RwKNuILA',
    appId: '1:384732469315:web:97b66fb6df0ec09b481cf6',
    messagingSenderId: '384732469315',
    projectId: 'ejemplo-2023-i',
    authDomain: 'ejemplo-2023-i.firebaseapp.com',
    storageBucket: 'ejemplo-2023-i.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZgenOU4CqS2DAkKSx4WDRFSz8THgZHME',
    appId: '1:384732469315:android:84ab77fd1ab59db4481cf6',
    messagingSenderId: '384732469315',
    projectId: 'ejemplo-2023-i',
    storageBucket: 'ejemplo-2023-i.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZw15ciycw_mKRblEw9Aw2o1Jz_5f8Srg',
    appId: '1:384732469315:ios:a040fc7aeab52f22481cf6',
    messagingSenderId: '384732469315',
    projectId: 'ejemplo-2023-i',
    storageBucket: 'ejemplo-2023-i.appspot.com',
    iosClientId: '384732469315-fsncho42n06it92o2m0g2mkeet46u99g.apps.googleusercontent.com',
    iosBundleId: 'com.example.dulceriaDiana2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZw15ciycw_mKRblEw9Aw2o1Jz_5f8Srg',
    appId: '1:384732469315:ios:a040fc7aeab52f22481cf6',
    messagingSenderId: '384732469315',
    projectId: 'ejemplo-2023-i',
    storageBucket: 'ejemplo-2023-i.appspot.com',
    iosClientId: '384732469315-fsncho42n06it92o2m0g2mkeet46u99g.apps.googleusercontent.com',
    iosBundleId: 'com.example.dulceriaDiana2',
  );
}
