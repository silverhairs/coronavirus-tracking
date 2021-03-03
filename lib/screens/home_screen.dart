import 'package:covid/components/general_stats_grid.dart';
import 'package:covid/screens/who_advice.dart';
import 'package:covid/components/following_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:covid/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = useProvider(themeNotifier);
    final isDarkTheme = useState(false);

    _themeProvider.getTheme == ThemeData.dark()
        ? isDarkTheme.value = true
        : isDarkTheme.value = false;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 40,
          leading: Container(),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  isDarkTheme.value
                      ? FontAwesomeIcons.sun
                      : FontAwesomeIcons.moon,
                  color: Colors.blueGrey,
                  size: 20),
              onPressed: () {
                isDarkTheme.value = !isDarkTheme.value;
                isDarkTheme.value
                    ? _themeProvider.setTheme(ThemeData.dark())
                    : _themeProvider.setTheme(ThemeData.light());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Global',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                height: 280,
                child: GeneralStatsGrid(isDarkTheme: isDarkTheme.value),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: isDarkTheme.value ? kBoxDarkColor : kBoxLightColor,
                  borderRadius: kBoxesRadius,
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.readme,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'Protective measures',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Protective measures against the coronavirus',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WhoAdvice(isDarkTheme.value),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  'Countries I follow',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              FollowingList(isDarkTheme.value),
            ],
          ),
        ),
      ),
    );
  }
}
