import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/tela_inicial.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key); // adicionando parâmetro key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Adoção",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const TelaAnimais(),

        // '/login': (context) => const Login(),
        //'cadastro': (context) => const Cadastro(),
      },
    );
  }
}
