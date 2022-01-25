import 'package:electro_calculation/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electro Calculation',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
    );
  }
}

