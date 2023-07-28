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
    apiKey: 'AIzaSyDbJFTPtKvnNzKc5hvVR1fMSbjbcvccHTg',
    appId: '1:231072860001:web:9067e825b6e2a95ebc6720',
    messagingSenderId: '231072860001',
    projectId: 'partilhe-mais',
    authDomain: 'partilhe-mais.firebaseapp.com',
    storageBucket: 'partilhe-mais.appspot.com',
    measurementId: 'G-T9MXX56DTW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8mfhFBhsNBT3510x7AG_KzuvIA_xsPW0',
    appId: '1:231072860001:android:511e88ca20ea5d92bc6720',
    messagingSenderId: '231072860001',
    projectId: 'partilhe-mais',
    storageBucket: 'partilhe-mais.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgcrvZlNgMdF5lV1s8upX2aQ50PSNvN0w',
    appId: '1:231072860001:ios:81e649f79bb4bb72bc6720',
    messagingSenderId: '231072860001',
    projectId: 'partilhe-mais',
    storageBucket: 'partilhe-mais.appspot.com',
    iosClientId: '231072860001-t9ce1sh6edl91fuu0fgj960q41iu9ggj.apps.googleusercontent.com',
    iosBundleId: 'com.example.partilheMais',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgcrvZlNgMdF5lV1s8upX2aQ50PSNvN0w',
    appId: '1:231072860001:ios:fd540f90be49e4fbbc6720',
    messagingSenderId: '231072860001',
    projectId: 'partilhe-mais',
    storageBucket: 'partilhe-mais.appspot.com',
    iosClientId: '231072860001-ue59a32vrc0st6kmfi0t45ags2k981bc.apps.googleusercontent.com',
    iosBundleId: 'com.example.partilheMais.RunnerTests',
  );
}
