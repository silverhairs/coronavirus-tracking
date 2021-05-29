part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.themeData});
  final CupertinoThemeData themeData;

  ThemeState copyWith({CupertinoThemeData? themeData}) => ThemeState(
        themeData: themeData ?? this.themeData,
      );

  @override
  List<Object?> get props => [themeData];
}
