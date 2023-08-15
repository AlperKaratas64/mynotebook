import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotebook/data/src/colors.dart';
import 'package:mynotebook/data/src/strings.dart';
import 'package:mynotebook/views/info/info_controller.dart';

class InfoPage extends GetWidget<InfoController> {
  const InfoPage({super.key});
  static const String routeName = '/views/info/info_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(infoAppBarText),
        backgroundColor: mainColor,
      ),
      body: Container(
        child: Text('Hakkımızda'),
      ),
    );
  }
}
