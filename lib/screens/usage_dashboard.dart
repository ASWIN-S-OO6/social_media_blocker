import 'package:flutter/material.dart';
import 'package:social_media_blocker/utils/firebase_utils.dart';
import 'package:social_media_blocker/models/usage_data.dart';

class UsageDashboard extends StatefulWidget {
  const UsageDashboard({super.key});

  @override
  State<UsageDashboard> createState() => _UsageDashboardState();
}

class _UsageDashboardState extends State<UsageDashboard> {
  List<UsageData> _usageData = [];

  @override
  void initState() {
    super.initState();
    FirebaseUtils.fetchUsageData().then((data) {
      setState(() {
        _usageData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usage Dashboard')),
      body: ListView.builder(
        itemCount: _usageData.length,
        itemBuilder: (context, index) {
          final usageData = _usageData[index];
          return ListTile(
            title: Text(usageData.device),
            subtitle: Text('Duration: ${usageData.duration} minutes'),
            trailing: Text(usageData.timestamp.toString()),
          );
        },
      ),
    );
  }
}
