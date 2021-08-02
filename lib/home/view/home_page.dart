import 'package:covid_tracker/core/cubit/global_stats_cubit.dart';
import 'package:covid_tracker/core/cubit/theme_cubit.dart';
import 'package:covid_tracker/core/utils/styles.dart';
import 'package:covid_tracker/home/view/widgets/global_stats_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static final route = MaterialPageRoute(builder: (_) => const HomePage());

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final globalStatsCubit = context.watch<GlobalStatsCubit>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80,
        title: Text(
          'Global',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: themeCubit.state.status == ThemeStatus.light
                    ? AwesomeColors.dark
                    : AwesomeColors.light,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              switch (themeCubit.state.status) {
                case ThemeStatus.light:
                  themeCubit.toDark();
                  break;
                default:
                  themeCubit.toLight();
                  break;
              }
            },
            icon: themeCubit.state.status == ThemeStatus.light
                ? const Icon(FlutterRemix.moon_fill, color: AwesomeColors.dark)
                : const Icon(FlutterRemix.sun_fill, color: AwesomeColors.ember),
          ),
          IconButton(
            onPressed: globalStatsCubit.getOverview,
            icon: Icon(FlutterRemix.restart_line,
                color: themeCubit.state.status == ThemeStatus.light
                    ? AwesomeColors.dark
                    : AwesomeColors.light),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Flexible(
              fit: FlexFit.tight,
              child: SizedBox(
                height: 250,
                child: GlobalStatsGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
