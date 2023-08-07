import 'package:get/get.dart';
import 'package:mynotebook/data/services/dio_manager.dart';
import 'package:mynotebook/data/services/register/register_service.dart';
import 'package:mynotebook/views/add_notes/add_notes_controller.dart';
import 'package:mynotebook/views/home/home_contoller.dart';
import 'package:mynotebook/views/login/login_controller.dart';
import 'package:mynotebook/views/register/register_controller.dart';

Future getControllers() async {
  Get.create(() => LoginController(),
      permanent: false); //permant verilerin saklanıp saklanmamasını belirtir.
  Get.create(() => RegisterController(Get.find()), permanent: false);
  Get.create(() => HomeController(), permanent: false);
  Get.create(() => AddNotesController(), permanent: false);

  Get.lazyPut(() => DioManager(), fenix: true);
  Get.lazyPut<RegisterService>(() => RegisterServiceImp(Get.find()));
}
