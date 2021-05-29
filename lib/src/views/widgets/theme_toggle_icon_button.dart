import 'package:covid/src/logic/cubit/cubits.dart';
import 'package:covid/src/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';

class ThemeToggleIconButton extends StatelessWidget {
  const ThemeToggleIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => BlocProvider.of<ThemeCubit>(context).toggle(),
      child: CupertinoTheme.of(context).brightness == Brightness.dark
          ? const Icon(
              FlutterRemix.sun_fill,
              color: AppColors.light,
            )
          : const Icon(
              FlutterRemix.moon_fill,
              color: AppColors.dark,
            ),
    );
  }
}
