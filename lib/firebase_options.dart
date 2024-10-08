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
    apiKey: 'AIzaSyA8MUrPiS-kPbqMAHwgDI_3q22At578oNI',
    appId: '1:907812321603:web:9cdea74d1e2eaa0f8197f6',
    messagingSenderId: '907812321603',
    projectId: 'traktor-family-gastro-bar',
    authDomain: 'traktor-family-gastro-bar.firebaseapp.com',
    databaseURL: 'https://traktor-family-gastro-bar-default-rtdb.firebaseio.com',
    storageBucket: 'traktor-family-gastro-bar.appspot.com',
    measurementId: 'G-S1RTN99YKL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzlVWAXUTnDIhENFrTAJspYOw-pOiXBnM',
    appId: '1:907812321603:android:042d37744c42413f8197f6',
    messagingSenderId: '907812321603',
    projectId: 'traktor-family-gastro-bar',
    databaseURL: 'https://traktor-family-gastro-bar-default-rtdb.firebaseio.com',
    storageBucket: 'traktor-family-gastro-bar.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBN-c8p82R7JBJFddrBPzY_XeeMncPP948',
    appId: '1:907812321603:ios:c3762a2af630d0088197f6',
    messagingSenderId: '907812321603',
    projectId: 'traktor-family-gastro-bar',
    databaseURL: 'https://traktor-family-gastro-bar-default-rtdb.firebaseio.com',
    storageBucket: 'traktor-family-gastro-bar.appspot.com',
    iosBundleId: 'com.example.traktorFamilyGastroBarAdminPanel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBN-c8p82R7JBJFddrBPzY_XeeMncPP948',
    appId: '1:907812321603:ios:ecbc9bfc9d3a1f1d8197f6',
    messagingSenderId: '907812321603',
    projectId: 'traktor-family-gastro-bar',
    databaseURL: 'https://traktor-family-gastro-bar-default-rtdb.firebaseio.com',
    storageBucket: 'traktor-family-gastro-bar.appspot.com',
    iosBundleId: 'com.kobetskiy.traktor-family-gastro-bar-admin-panel',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA8MUrPiS-kPbqMAHwgDI_3q22At578oNI',
    appId: '1:907812321603:web:e340a8819b368a618197f6',
    messagingSenderId: '907812321603',
    projectId: 'traktor-family-gastro-bar',
    authDomain: 'traktor-family-gastro-bar.firebaseapp.com',
    databaseURL: 'https://traktor-family-gastro-bar-default-rtdb.firebaseio.com',
    storageBucket: 'traktor-family-gastro-bar.appspot.com',
    measurementId: 'G-YL6Z40MHR6',
  );
}
