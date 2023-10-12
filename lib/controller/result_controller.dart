import 'package:get/get.dart';

class ResultController extends GetxController {
  var argumentData = Get.arguments;
  var name = "".obs;
  var rut = "".obs;
  var email = "".obs;
  var address = "".obs;
  var phone = "".obs;

  @override
  void onInit() {
    onReady();
    super.onInit();
  }

  @override
  void onReady() {
    if (argumentData != null) {
      name.value = argumentData["name"];
      rut.value = argumentData["rut"];
      email.value = argumentData["email"];
      address.value = argumentData["address"];
      phone.value = argumentData["phone"];
    }
    super.onReady();
  }

  void cleanAll() {
    name.value = "";
    rut.value = "";
    email.value = "";
    address.value = "";
    phone.value = "";
  }
}
