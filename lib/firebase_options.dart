import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCbu8L0nXL_qw9op6rPu7BoPxbKguTx31M',
    appId: '1:890075765508:web:6647b5132037c1b07e8e51',
    messagingSenderId: '890075765508',
    projectId: 'minchatapp-ecfc2',
    authDomain: 'minchatapp-ecfc2.firebaseapp.com',
    storageBucket: 'minchatapp-ecfc2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOrTxUbvLWihLQ5Uqce6tVD2yRViCUaXs',
    appId: '1:890075765508:android:499feab63f8bcaa87e8e51',
    messagingSenderId: '890075765508',
    projectId: 'minchatapp-ecfc2',
    storageBucket: 'minchatapp-ecfc2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUM9pcYVCHfrS9RRhfsouo8oihjUICTTQ',
    appId: '1:890075765508:ios:befed4037ef174e17e8e51',
    messagingSenderId: '890075765508',
    projectId: 'minchatapp-ecfc2',
    storageBucket: 'minchatapp-ecfc2.firebasestorage.app',
    iosClientId: '890075765508-1234567890.apps.googleusercontent.com',
    iosBundleId: 'com.example.minChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'YOUR-MACOS-API-KEY',
    appId: 'YOUR-MACOS-APP-ID',
    messagingSenderId: 'YOUR-SENDER-ID',
    projectId: 'YOUR-PROJECT-ID',
    storageBucket: 'YOUR-STORAGE-BUCKET',
    iosClientId: 'YOUR-MACOS-CLIENT-ID',
    iosBundleId: 'YOUR-MACOS-BUNDLE-ID',
  );
} 