import 'package:covid/constants.dart';
import 'package:covid/core/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocsDir.path);
  Hive.registerAdapter(CountryAdapter());
  await Hive.openBox<List<Country>>('following');
  await Hive.openBox<String>('appTheme');
  runApp(ProviderScope(child: CoronaVirusApp()));
}

class CoronaVirusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialAppWithTheme();
  }
}

class MaterialAppWithTheme extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeNotifier).getTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      home: HomeScreen(),
    );
  }
}
