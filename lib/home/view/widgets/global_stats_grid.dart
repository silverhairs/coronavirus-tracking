import 'package:covid_tracker/core/cubit/global_stats_cubit.dart';
import 'package:covid_tracker/core/cubit/theme_cubit.dart';
import 'package:covid_tracker/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GlobalStatsGrid extends StatelessWidget {
  const GlobalStatsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalStatsState = context.watch<GlobalStatsCubit>().state;
    final themeStatus = context.watch<ThemeCubit>().state.status;
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 2,
      children: [
        InfoBox(
          key: const Key('cases-box'),
          theme: themeStatus,
          statState: globalStatsState,
          label: 'Total Cases',
          data: globalStatsState.data.cases.toString(),
          icon: FlutterRemix.earth_fill,
          itemPrimaryColor: AwesomeColors.blue,
        ),
        InfoBox(
          key: const Key('countries-box'),
          theme: themeStatus,
          statState: globalStatsState,
          itemPrimaryColor: AwesomeColors.ember,
          data: globalStatsState.data.affectedCountries.toString(),
          icon: FlutterRemix.flag_2_fill,
          label: 'Countries',
        ),
        InfoBox(
          key: const Key('deaths'),
          theme: themeStatus,
          statState: globalStatsState,
          itemPrimaryColor: AwesomeColors.red,
          data: globalStatsState.data.deaths.toString(),
          icon: FlutterRemix.skull_2_fill,
          label: 'Total Deaths',
        ),
        InfoBox(
          theme: themeStatus,
          statState: globalStatsState,
          itemPrimaryColor: AwesomeColors.green,
          data: globalStatsState.data.recovered.toString(),
          icon: FlutterRemix.shield_check_fill,
          label: 'Total Recovered',
        ),
      ],
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({
    Key? key,
    required this.theme,
    required this.statState,
    required this.itemPrimaryColor,
    required this.data,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final ThemeStatus theme;
  final GlobalStatsState statState;
  final Color itemPrimaryColor;
  final IconData icon;
  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme == ThemeStatus.dark
            ? AwesomeColors.darkBlue
            : AwesomeColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: itemPrimaryColor,
                child: Icon(icon, color: AwesomeColors.white),
              ),
              const SizedBox(width: 18),
              statState.status == GlobalStatsStatus.loading
                  ? SpinKitFadingCircle(color: itemPrimaryColor)
                  : statState.status == GlobalStatsStatus.failure
                      ? Row(
                          children: const [
                            Icon(
                              FlutterRemix.error_warning_fill,
                              color: AwesomeColors.red,
                            ),
                            Text(
                              'Failed to load!',
                              style: TextStyle(color: AwesomeColors.red),
                            )
                          ],
                        )
                      : Text(data)
            ],
          ),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.left),
        ],
      ),
    );
  }
}
