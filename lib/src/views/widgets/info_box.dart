import 'package:covid/src/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show CircleAvatar;

class InfoBox extends StatelessWidget {
  const InfoBox({
    Key? key,
    required this.label,
    required this.icon,
    required this.number,
    required this.iconBackground,
    this.height = 75,
  }) : super(key: key);

  final double height;
  final int number;
  final String label;
  final Color iconBackground;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: defaultRadius,
        color: CupertinoTheme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '$number',
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: iconBackground,
                child: Icon(icon, color: AppColors.white),
              ),
              const SizedBox(width: 8),
              Text(label),
            ],
          )
        ],
      ),
    );
  }
}
