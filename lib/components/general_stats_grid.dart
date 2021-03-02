import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import '../constants.dart';
import 'info_box.dart';

class GeneralStatsGrid extends StatelessWidget {
  final bool isDarkTheme;
  const GeneralStatsGrid({@required this.isDarkTheme});

  Stream<Response> getCovidGeneralStats() async* {
    yield* Stream.periodic(Duration(seconds: 3), (_) {
      return get(allCasesAPI);
    }).asyncMap(
      (event) async => await event,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Response>(
      stream: getCovidGeneralStats(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = jsonDecode(snapshot.data.body);
          int cases = data['cases'];
          int deaths = data['deaths'];
          int recovered = data['recovered'];
          int countries = data["affectedCountries"];
          return GridView.count(
            primary: false,
            crossAxisSpacing: 6,
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            childAspectRatio:
                screenWidth(context) / (screenHeight(context) * 0.32),
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              InfoBox(
                isDark: this.isDarkTheme,
                title: 'Total cases',
                number: cases,
                color: Colors.blue,
                icon: Icon(FontAwesomeIcons.globeAmericas,
                    color: Colors.white, size: 20),
              ),
              InfoBox(
                isDark: this.isDarkTheme,
                title: 'Countries',
                color: Colors.orange,
                icon: Icon(Icons.flag, color: Colors.white),
                number: countries,
                onPressed: () {
                  print("//TODO:Hey");
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => GeneralStatsGrid(),
                  //   ),
                  // );
                },
              ),
              InfoBox(
                isDark: this.isDarkTheme,
                title: 'Deaths',
                color: Colors.red,
                icon: Icon(
                  FontAwesomeIcons.skull,
                  color: Colors.white,
                  size: 20,
                ),
                number: deaths,
              ),
              InfoBox(
                isDark: this.isDarkTheme,
                title: 'Recovered',
                number: recovered,
                color: Colors.green,
                icon: Icon(Icons.check, color: Colors.white),
              ),
            ],
          );
        }
        return Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: kBoxesRadius,
            color: this.isDarkTheme ? kBoxDarkColor : kBoxLightColor,
          ),
          child: Center(
            child: SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
