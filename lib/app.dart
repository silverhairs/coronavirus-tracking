import 'package:covid/src/logic/cubit/cubits.dart';
import 'package:covid/src/views/layout.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CoronavirusApp extends StatelessWidget {
  CoronavirusApp([Key? key]) : super(key: key);
  final http.Client httpClient = http.Client();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, themeState) {
        return CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: themeState.themeData,
          home: const MainLayout(),
        );
      },
    );
  }
}
