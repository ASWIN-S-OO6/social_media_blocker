import 'package:cloud_firestore/cloud_firestore.dart';

class UsageData {
  final String device;
  final int duration;
  final Timestamp timestamp;

  UsageData({required this.device, required this.duration, required this.timestamp});

  factory UsageData.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return UsageData(
      device: data['device'] ?? '',
      duration: data['duration'] ?? 0,
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }
}
