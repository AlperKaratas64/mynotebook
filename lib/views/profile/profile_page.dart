import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotebook/data/src/colors.dart';
import 'package:mynotebook/data/src/strings.dart';
import 'package:mynotebook/views/profile/profile_controller.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({super.key});
  static const String routeName = '/views/profile/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(profileAppBarText),
        backgroundColor: mainColor,
      ),
      body: Container(
        child: Text('Profile sayfası'),
      ),
    );
  }
}
