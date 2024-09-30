import 'package:flutter/material.dart';
import 'package:social_media_blocker/utils/firebase_utils.dart';
import 'package:social_media_blocker/utils/blocking_utils.dart';

class BlockSettings extends StatefulWidget {
  const BlockSettings({super.key});

  @override
  State<BlockSettings> createState() => _BlockSettingsState();
}

class _BlockSettingsState extends State<BlockSettings> {
  final TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Block Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Block Duration (minutes)',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final duration = int.tryParse(_durationController.text);
                if (duration != null) {
                  await FirebaseUtils.blockSocialMedia(duration);
                  BlockerUtils.blockAppsForDuration(duration);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Social media blocked successfully.'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid duration.'),
                    ),
                  );
                }
              },
              child: const Text('Block'),
            ),
          ],
        ),
      ),
    );
  }
}
