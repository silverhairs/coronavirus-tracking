import 'package:covid/src/logic/cubit/cubits.dart';
import 'package:covid/src/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix/flutter_remix.dart';

import 'screens/countries_screen.dart';
import 'screens/global_screen.dart';

class MainLayout extends HookWidget {
  const MainLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            activeColor: AppColors.blue,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FlutterRemix.earth_line),
                activeIcon: Icon(FlutterRemix.earth_fill),
                label: 'Global',
                tooltip: 'Global',
              ),
              BottomNavigationBarItem(
                icon: Icon(FlutterRemix.flag_line),
                activeIcon: Icon(FlutterRemix.flag_fill),
                label: 'Countries',
                tooltip: 'Countries',
              ),
            ],
          ),
          tabBuilder: (context, index) => CupertinoTabView(
            builder: (context) {
              if (index == 0) return GlobalScreen(themeState: state);
              return CountriesListScreen(themeState: state);
            },
          ),
        );
      },
    );
  }
}
