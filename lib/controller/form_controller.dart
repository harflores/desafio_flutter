import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/result_screen.dart';

class FormController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController rut = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();

// Envia por argumentos los datos capturados a la pantalla ResultScreen()
  void sendForm() {
    Get.to(
      () => ResultScreen(),
      arguments: {
        "name": name.text,
        "rut": rut.text,
        "email": email.text,
        "address": address.text,
        "phone": phone.text,
      },
    );
  }
}
