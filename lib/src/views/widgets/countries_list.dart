import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid/src/logic/bloc/blocs.dart';
import 'package:covid/src/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show OutlinedButton, Material, ListTile, ButtonStyle, MaterialStateProperty;
import 'package:flutter_remix/flutter_remix.dart';

class SliverCountriesList extends StatelessWidget {
  const SliverCountriesList({Key? key, required this.state}) : super(key: key);

  final CountriesState state;
  @override
  Widget build(BuildContext context) {
    if (state.status == CountriesFetchingStatus.failure) {
      return SliverList(
        delegate: SliverChildListDelegate(const [
          Text(
            'Failed to fetch countries',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
            ),
          ),
          SizedBox(height: 20),
          Icon(
            FlutterRemix.error_warning_fill,
            color: CupertinoColors.systemGrey,
            size: 40,
          )
        ]),
      );
    }
    if (state.countries.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CupertinoActivityIndicator(radius: 40),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, idx) {
        var country = state.countries[idx];
        return Material(
          color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: defaultRadius,
              child: CachedNetworkImage(
                height: 30,
                width: 50,
                fit: BoxFit.cover,
                imageUrl: country.flagURL!,
                placeholder: (context, url) =>
                    const CupertinoActivityIndicator(),
                errorWidget: (context, url, child) =>
                    const Icon(FlutterRemix.error_warning_line),
              ),
            ),
            title: Text(country.name, style: titleStyle(context)),
            isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total cases: ${country.cases}',
                  style: subtitleStyle(context),
                ),
                Text(
                  'Total recovered: ${country.recovered}',
                  style: subtitleStyle(context),
                ),
              ],
            ),
            trailing: OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => country.isTracked!
                        ? AppColors.blue
                        : CupertinoTheme.of(context).scaffoldBackgroundColor,
                  ),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: defaultRadius * 2,
                      side: const BorderSide(color: AppColors.blue),
                    ),
                  ),
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.all(8),
                  )),
              onPressed: () => '//TODO: track',
              child: country.isTracked!
                  ? const Text(
                      'Tracking',
                      style: TextStyle(color: AppColors.white),
                    )
                  : const Text(
                      'Track',
                      style: TextStyle(color: AppColors.blue),
                    ),
            ),
          ),
        );
      }, childCount: state.countries.length),
    );
  }
}
