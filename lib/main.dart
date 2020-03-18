import 'package:covid/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CoronaVirusApp());

class CoronaVirusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData.dark(),
    );
  }
}
