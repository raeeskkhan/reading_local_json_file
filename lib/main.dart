import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'HomePageTwo.dart';
import 'HomePageThree.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "READ LOCAL JSON",
      home: HomePageThree(),
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
    );
  }
}
