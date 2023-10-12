import 'package:desafio_flutter/controller/result_controller.dart';
import 'package:desafio_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final ResultController rcontroller = Get.put(ResultController());
    double heigthSizeBox = 20;
    return WillPopScope(
      onWillPop: () async {
        rcontroller.cleanAll();
        Get.delete();
        Get.back();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Resultado"),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomTitleText(
                  textTitle: "Nombre y Apellido:",
                ),
                CustomResultText(resultText: rcontroller.name.value),
                SizedBox(
                  height: heigthSizeBox,
                ),
                const CustomTitleText(
                  textTitle: "Rut:",
                ),
                CustomResultText(resultText: rcontroller.rut.value),
                SizedBox(
                  height: heigthSizeBox,
                ),
                const CustomTitleText(
                  textTitle: "Correo electrónico:",
                ),
                CustomResultText(resultText: rcontroller.email.value),
                SizedBox(
                  height: heigthSizeBox,
                ),
                const CustomTitleText(
                  textTitle: "Dirección:",
                ),
                CustomResultText(resultText: rcontroller.address.value),
                SizedBox(
                  height: heigthSizeBox,
                ),
                const CustomTitleText(
                  textTitle: "Teléfono:",
                ),
                CustomResultText(resultText: rcontroller.phone.value),
                SizedBox(
                  height: heigthSizeBox,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.deleteAll();
                        Get.offAll(() => const HomeScreen());
                      },
                      child: const Text("Aceptar"),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class CustomResultText extends StatefulWidget {
  const CustomResultText({
    super.key,
    required this.resultText,
  });

  final String resultText;

  @override
  State<CustomResultText> createState() => _CustomResultTextState();
}

class _CustomResultTextState extends State<CustomResultText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.resultText,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({
    super.key,
    required this.textTitle,
  });
  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Text(textTitle);
  }
}
