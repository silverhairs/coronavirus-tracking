import 'package:covid/providers/following_data.dart';
import 'package:covid/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(CoronaVirusApp());

class CoronaVirusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FollowingData(),
      child: MaterialApp(
        home: Home(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
