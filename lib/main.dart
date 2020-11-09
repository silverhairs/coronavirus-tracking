import 'package:covid/constants.dart';
import 'core/providers/theme_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'core/models/following.dart';
import 'core/providers/following_data.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter(FollowingAdapter());
  runApp(
    CoronaVirusApp(),
  );
}

class CoronaVirusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FollowingData()),
        ChangeNotifierProvider(create: (_) => ThemeChanger(kLightTheme)),
      ],
      child: MaterialAppWithTheme(
        home: FutureBuilder(
          future: Hive.openBox<List<Following>>('following'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Card(
                      elevation: 7,
                      child: Text(snapshot.error.toString()),
                    ),
                  ),
                );
              } else {
                return Home();
              }
            }
            return CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}

class MaterialAppWithTheme extends StatefulWidget {
  final Widget home;
  MaterialAppWithTheme({@required this.home});
  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme,
      home: this.widget.home,
      debugShowCheckedModeBanner: false,
    );
  }
}
