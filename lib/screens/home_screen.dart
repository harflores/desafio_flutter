import 'package:desafio_flutter/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleApp = "Desafío Flutter";
    return Scaffold(
      appBar: AppBar(title: const Text(titleApp)),
      drawer: const CustomDrawer(titleApp: titleApp),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.titleApp,
  });
  final String titleApp;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue.shade100,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            heightFactor: 2,
            child: Text(
              titleApp,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(const HomeScreen());
              },
              child: const Text("Inicio"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(FormScreen());
              },
              child: const Text("Formulario"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Opcion 1"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Opcion 2"),
            ),
          ),
        ],
      ),
    );
  }
}
