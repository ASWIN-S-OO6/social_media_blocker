import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_blocker/models/usage_data.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD-Y2I8PEh56ZdpgivXINIVBM3b5pFhayI",
      authDomain: "mysocialmediablockerapp.firebaseapp.com",
      projectId: "mysocialmediablockerapp",
      storageBucket: "mysocialmediablockerapp.appspot.com",
      messagingSenderId: "794316993558",
      appId: "1:794316993558:android:c5d38d319bfde9b24af137",
    ),
  );
  print('Firebase initialized successfully');
}

class FirebaseUtils {
  static Future<void> blockSocialMedia(int duration) async {
    await FirebaseFirestore.instance.collection('blocked').add({
      'duration': duration,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  static Future<List<UsageData>> fetchUsageData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('usageData').get();
    return snapshot.docs.map((doc) => UsageData.fromFirestore(doc)).toList();
  }
}
