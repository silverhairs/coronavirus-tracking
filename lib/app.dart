import 'package:covid/src/logic/brightness_cubit.dart';
import 'package:covid/src/utils/styles.dart';
import 'package:covid/src/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CoronavirusApp extends StatelessWidget {
  CoronavirusApp([Key? key]) : super(key: key);
  final http.Client httpClient = http.Client();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrightnessCubit, Brightness>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state == Brightness.dark
              ? darkTheme(context)
              : lightTheme(context),
          home: const HomeScreen(),
        );
      },
    );
  }
}
