import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/models/contacts.dart';
import 'package:bytebank2/screens/contacts_list.dart';
import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

void main() {
  runApp(MyApp());
  save(Contacts(
    0,
    'Daniel',
    1000,
  )).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      // home: Dashboard(),
      home: Dashboard(),
    );
  }
}
