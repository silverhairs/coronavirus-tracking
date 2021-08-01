part of 'theme_cubit.dart';

enum ThemeStatus { light, dark, failure }

class ThemeState extends Equatable {
  const ThemeState({
    this.status = ThemeStatus.light,
    required this.themeData,
  });

  final ThemeData themeData;
  final ThemeStatus status;

  @override
  List<Object> get props => [themeData, status];
}
