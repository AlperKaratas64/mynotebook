import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotebook/data/src/colors.dart';
import 'package:mynotebook/data/src/images.dart';
import 'package:mynotebook/data/src/strings.dart';
import 'package:mynotebook/views/add_notes/add_notes_page.dart';
import 'package:mynotebook/views/home/home_contoller.dart';
import 'package:mynotebook/views/info/info_page.dart';
import 'package:mynotebook/views/login/login_page.dart';
import 'package:mynotebook/views/profile/profile_page.dart';

class HomePage extends GetWidget<HomeController> {
  static const String routeName = '/views/home/home_Page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homeAppBarText),
        backgroundColor: mainColor,
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _goToAddNotePage(),
      child: Icon(Icons.add),
      backgroundColor: mainColor,
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: _buildCard(index),
      ),
      itemCount: 5,
    );
  }

  Widget _buildCard(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('Not $index'),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildTitle(homeAppBarText, Icons.home, _goToback),
          _buildDivider(),
          _buildTitle(profiletext, Icons.person, _goToProfile),
          _buildDivider(),
          _buildTitle(infoText, Icons.info, _goToInfo),
          _buildDivider(),
          _buildTitle(logoutText, Icons.logout, _goToLogout),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return const UserAccountsDrawerHeader(
      accountName: Text('Alper'),
      accountEmail: Text('Alperk6420@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage(githubLogo),
      ),
      decoration: BoxDecoration(color: mainColor),
    );
  }

  Widget _buildTitle(String text, IconData, Function function) {
    return ListTile(
      title: Text(text),
      leading: Icon(
        IconData,
        color: mainColor,
      ),
      onTap: () => function(),
    );
  }

  Widget _buildDivider() {
    return Divider();
  }

  void _goToback() {
    Get.back();
  }

  void _goToProfile() {
    Get.toNamed(ProfilePage.routeName);
  }

  void _goToInfo() {
    Get.toNamed(InfoPage.routeName);
  }

  void _goToLogout() {
    Get.offAndToNamed(LoginPage.routeName);
  }

  void _goToAddNotePage() {
    Get.toNamed(AddNotesPage.routeName);
  }
}
