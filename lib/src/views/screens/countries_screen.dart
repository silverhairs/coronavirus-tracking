import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid/src/logic/bloc/blocs.dart';
import 'package:covid/src/logic/cubit/cubits.dart';
import 'package:covid/src/utils/styles.dart';
import 'package:covid/src/views/widgets/theme_toggle_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material, ListTile, CircleAvatar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix/flutter_remix.dart';

class CountriesListScreen extends HookWidget {
  const CountriesListScreen({required this.themeState, Key? key})
      : super(key: key);

  final ThemeState themeState;

  @override
  Widget build(BuildContext context) {
    final searchController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final pageController = useScrollController(debugLabel: 'page');
    final countriesListController = useScrollController(debugLabel: 'list');

    return BlocConsumer<CountriesBloc, CountriesState>(
      listener: (context, state) {},
      builder: (context, state) => CupertinoPageScaffold(
        child: NestedScrollView(
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, isChildScrolled) => [
            CupertinoSliverNavigationBar(
              backgroundColor:
                  CupertinoTheme.of(context).scaffoldBackgroundColor,
              border: null,
              stretch: true,
              largeTitle: const Text('Countries'),
              trailing: const ThemeToggleIconButton(),
            ),
            SliverPersistentHeader(
              delegate: _SliverSearchbarDelegate(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CupertinoTextField(
                    controller: searchController,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        FlutterRemix.search_2_line,
                        color: CupertinoColors.systemGrey4,
                      ),
                    ),
                    placeholder: 'Search country',
                    textInputAction: TextInputAction.search,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoTheme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: countriesListController,
            itemCount: state.countries.length,
            itemBuilder: (context, idx) {
              var country = state.countries[idx];
              return Material(
                color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.yellow,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: CachedNetworkImage(
                        imageUrl: country.flagURL!,
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(),
                        errorWidget: (context, url, child) =>
                            const Icon(FlutterRemix.error_warning_line),
                      ),
                    ),
                  ),
                  title: Text(country.name),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SliverSearchbarDelegate extends SliverPersistentHeaderDelegate {
  const _SliverSearchbarDelegate({
    required this.child,
    this.maxHeight = 56.0,
    this.minHeight = 56,
  });

  final Widget child;
  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverSearchbarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
