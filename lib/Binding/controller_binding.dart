import 'package:blog_crud/Controllers/word_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WordController>(WordController());
  }
}
