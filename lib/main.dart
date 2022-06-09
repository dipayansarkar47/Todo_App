import 'package:flutter/material.dart';
import 'package:todo_app_v2/HomePage.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: true,
    ),
    home: HomePage(),
  ));
}