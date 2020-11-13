import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTranferencias(),
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
    );
  }
}
