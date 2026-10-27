import 'package:flutter/material.dart';

import 'screens/tela_abertura.dart';

void main() {
  runApp(const VisitaMaisApp());
}

class VisitaMaisApp extends StatelessWidget {
  const VisitaMaisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visita+',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TelaAbertura(),
    );
  }
}