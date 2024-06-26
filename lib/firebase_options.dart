// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBCnoni5kpGzSIFACdbb2CQhmFuAOByjzE',
    appId: '1:353490167377:web:eb599419f3b53758337a70',
    messagingSenderId: '353490167377',
    projectId: 'maxmovement-a3b69',
    authDomain: 'maxmovement-a3b69.firebaseapp.com',
    storageBucket: 'maxmovement-a3b69.appspot.com',
    measurementId: 'G-MMY2P7F9MN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCWW9QV1bKPjwQwR_Dqmd2HXOL5m10l1c',
    appId: '1:353490167377:android:78356ff68c198231337a70',
    messagingSenderId: '353490167377',
    projectId: 'maxmovement-a3b69',
    storageBucket: 'maxmovement-a3b69.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCh3LFhaWautARonYH9IT5hURwHI4xT_ko',
    appId: '1:353490167377:ios:8b95d11f27b0569c337a70',
    messagingSenderId: '353490167377',
    projectId: 'maxmovement-a3b69',
    storageBucket: 'maxmovement-a3b69.appspot.com',
    iosBundleId: 'com.example.maxmovement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCh3LFhaWautARonYH9IT5hURwHI4xT_ko',
    appId: '1:353490167377:ios:8b95d11f27b0569c337a70',
    messagingSenderId: '353490167377',
    projectId: 'maxmovement-a3b69',
    storageBucket: 'maxmovement-a3b69.appspot.com',
    iosBundleId: 'com.example.maxmovement',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBCnoni5kpGzSIFACdbb2CQhmFuAOByjzE',
    appId: '1:353490167377:web:a4361d31a8143df4337a70',
    messagingSenderId: '353490167377',
    projectId: 'maxmovement-a3b69',
    authDomain: 'maxmovement-a3b69.firebaseapp.com',
    storageBucket: 'maxmovement-a3b69.appspot.com',
    measurementId: 'G-XN0J98X34X',
  );
}
