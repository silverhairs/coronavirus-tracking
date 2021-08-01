import 'package:covid_tracker/core/cubit/theme_cubit.dart';
import 'package:covid_tracker/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix/flutter_remix.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  static final route = MaterialPageRoute(builder: (_) => const HomePage());

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final currentScreenIndex = useState(0);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreenIndex.value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FlutterRemix.global_line),
            label: 'Global',
            activeIcon: Icon(FlutterRemix.global_fill),
            tooltip: 'Global',
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterRemix.list_unordered),
            label: 'Countries',
            activeIcon: Icon(FlutterRemix.list_unordered),
            tooltip: 'Countries',
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterRemix.star_line),
            label: 'Tracking List',
            tooltip: 'Tracking List',
            activeIcon: Icon(FlutterRemix.star_fill),
          )
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (index) => currentScreenIndex.value = index,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
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
          )
        ],
      ),
      body: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [],
      ),
    );
  }
}
