import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/form_controller.dart';
import '../widgets/custom_textformfield.dart';

class FormScreen extends StatelessWidget {
  FormScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  final FormController fcontroller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    double heightSize = 30;
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario")),
      body: GestureDetector(
        onTap: () {
          focusNode.requestFocus();
        },
        child: SingleChildScrollView(
          child: Center(
              child: Form(
                  key: formKey,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          labelText: "Nombre y Apellido",
                          controller: fcontroller.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Debe ingresar Nombre y Apellido";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: heightSize,
                        ),
                        CustomTextFormField(
                          labelText: "Rut",
                          controller: fcontroller.rut,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (!isValidRUT(value.toString())) {
                              return "Debe ingresar RUT Ej. 12.345.678-9";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9kK.-]')), // Permite números, "k", "K" y guion
                            LengthLimitingTextInputFormatter(12), // Limita la longitud total a 12 caracteres
                            RutInputFormatter(), // Aplica el formatter específico para el RUT
                          ],
                        ),
                        SizedBox(
                          height: heightSize,
                        ),
                        CustomTextFormField(
                          labelText: "Correo electrónico",
                          controller: fcontroller.email,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (!isValidEmail(value.toString())) {
                              return "Debe ingresar correo electrónico";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]+')),
                          ],
                        ),
                        SizedBox(
                          height: heightSize,
                        ),
                        CustomTextFormField(
                          labelText: "Dirección",
                          controller: fcontroller.address,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Debe ingresar direccion";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: heightSize,
                        ),
                        CustomTextFormField(
                          labelText: "Teléfono",
                          controller: fcontroller.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Debe ingresar teléfono";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: heightSize,
                        ),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                fcontroller.sendForm();
                              }
                            },
                            child: const Text("Guardar"),
                          ),
                        )
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}

bool isValidEmail(String email) {
  // Expresión regular para validar un correo electrónico
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegex.hasMatch(email);
}

bool isValidRUT(String rut) {
  // Expresión regular para validar un RUT en formato "11.111.111-1"
  final RegExp rutRegex = RegExp(r'^\d{2}\.\d{3}\.\d{3}-[\dkK]$');
  return rutRegex.hasMatch(rut);
}

class RutInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    // Si se ingresa un guion "-" en una posición no válida, elimínalo
    if (text.endsWith('-') && text.length != 11) {
      text = text.substring(0, text.length - 1);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
