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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCG6zgGhNLDj1-q0VnF0jaqzzmuXj4ty5U',
    appId: '1:164031765924:android:f1bdc34ffa8fc787667531',
    messagingSenderId: '164031765924',
    projectId: 'iraq-baity_app',
    databaseURL: 'https://iraq-baity_app-default-rtdb.firebaseio.com',
    storageBucket: 'iraq-baity_app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAraIi7rieDN3OXAP8n2qoDhkkB2QBWo50',
    appId: '1:164031765924:ios:094c453c79a77a98667531',
    messagingSenderId: '164031765924',
    projectId: 'iraq-baity_app',
    databaseURL: 'https://iraq-baity_app-default-rtdb.firebaseio.com',
    storageBucket: 'iraq-baity_app.firebasestorage.app',
    iosBundleId: 'com.saif.baity_app',
  );
}
