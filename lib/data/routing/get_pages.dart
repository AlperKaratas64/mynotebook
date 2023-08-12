import 'package:get/get.dart';
import 'package:mynotebook/views/add_notes/add_notes_page.dart';
import 'package:mynotebook/views/home/home_page.dart';
import 'package:mynotebook/views/login/login_page.dart';
import 'package:mynotebook/views/register/register_page.dart';

List<GetPage> getPages = [
  GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
  GetPage(name: RegisterPage.routeName, page: () => const RegisterPage()),
  GetPage(name: HomePage.routeName, page: () => const HomePage()),
  GetPage(name: AddNotesPage.routeName, page: () => const AddNotesPage()),
];
