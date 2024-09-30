import 'package:flutter/material.dart';
import 'package:social_media_blocker/models/social_media.dart';

class SocialMediaList extends StatelessWidget {
  const SocialMediaList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: socialMediaList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(socialMediaList[index].name),
        leading: Icon(socialMediaList[index].icon),
      ),
    );
  }
}

final List<SocialMedia> socialMediaList = [
  SocialMedia(name: 'Facebook', icon: Icons.facebook),
  SocialMedia(name: 'Instagram', icon: Icons.camera_alt),
];
