import 'package:covid/src/logic/cubit/cubits.dart';
import 'package:covid/src/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix/flutter_remix.dart';

class ThemeToggleIconButton extends HookWidget {
  const ThemeToggleIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = false;

    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: ThemeCubit(),
      builder: (context, state) {
        isDark = state.themeData.brightness == Brightness.dark;

        return CupertinoButton(
          onPressed: () {
            if (isDark) {
              context.read<ThemeCubit>().toggle(lightTheme);
            } else {
              context.read<ThemeCubit>().toggle(darkTheme);
            }
          },
          child: isDark
              ? const Icon(FlutterRemix.sun_fill, color: AppColors.light)
              : const Icon(FlutterRemix.moon_fill, color: AppColors.dark),
        );
      },
    );
  }
}
