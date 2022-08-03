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
    apiKey: 'AIzaSyBkDmkd9tgOZVpDmIiIXcBHQZ8vyWPMkpI',
    appId: '1:695297658587:web:fe78a90ff9d788e67886fe',
    messagingSenderId: '695297658587',
    projectId: 'todo-get-420',
    authDomain: 'todo-get-420.firebaseapp.com',
    storageBucket: 'todo-get-420.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuIs1rhDQ72LAiDtLZbmVI3bVdQI9XNk4',
    appId: '1:695297658587:android:8e424a27bc072dee7886fe',
    messagingSenderId: '695297658587',
    projectId: 'todo-get-420',
    storageBucket: 'todo-get-420.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHfIf7OpgBiQ1K76Qu6YmL1l9pfoUEXSk',
    appId: '1:695297658587:ios:c7eb0b62c69294577886fe',
    messagingSenderId: '695297658587',
    projectId: 'todo-get-420',
    storageBucket: 'todo-get-420.appspot.com',
    iosClientId: '695297658587-m0anmvll63mt75f49c9rdgio8rr9abkn.apps.googleusercontent.com',
    iosBundleId: 'me.jaimonga420.todoGet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHfIf7OpgBiQ1K76Qu6YmL1l9pfoUEXSk',
    appId: '1:695297658587:ios:c7eb0b62c69294577886fe',
    messagingSenderId: '695297658587',
    projectId: 'todo-get-420',
    storageBucket: 'todo-get-420.appspot.com',
    iosClientId: '695297658587-m0anmvll63mt75f49c9rdgio8rr9abkn.apps.googleusercontent.com',
    iosBundleId: 'me.jaimonga420.todoGet',
  );
}