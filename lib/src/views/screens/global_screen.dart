import 'package:covid/src/logic/bloc/blocs.dart';
import 'package:covid/src/logic/cubit/cubits.dart';
import 'package:covid/src/utils/styles.dart';
import 'package:covid/src/views/screens/who_article_screen.dart';
import 'package:covid/src/views/widgets/info_box.dart';
import 'package:covid/src/views/widgets/theme_toggle_icon_button.dart';
import 'package:covid/src/views/widgets/tracking_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material, ListTile, CircleAvatar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix/flutter_remix.dart';

class GlobalScreen extends HookWidget {
  const GlobalScreen({required this.themeState, Key? key}) : super(key: key);

  final ThemeState themeState;
  final String title = 'Global';

  @override
  Widget build(BuildContext context) {
    final pageScrollController = useScrollController(debugLabel: 'page');

    return BlocConsumer<GeneralDataBloc, GeneralDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        final _infoBoxes = [
          InfoBox(
            key: const Key('cases'),
            label: 'Total Cases',
            number: state.data.cases,
            icon: FlutterRemix.earth_fill,
            iconBackground: AppColors.blue,
          ),
          InfoBox(
            key: const Key('countries'),
            label: 'Countries',
            icon: FlutterRemix.flag_fill,
            number: state.data.affectedCountries,
            iconBackground: AppColors.yellow,
          ),
          InfoBox(
            key: const Key('deaths'),
            label: 'Deaths',
            icon: FlutterRemix.emotion_sad_line,
            number: state.data.deaths,
            iconBackground: AppColors.red,
          ),
          InfoBox(
            key: const Key('recovered'),
            label: 'Recovered',
            icon: FlutterRemix.emotion_happy_line,
            number: state.data.recovered,
            iconBackground: AppColors.green,
          ),
        ];
        return CupertinoPageScaffold(
          child: CustomScrollView(
            controller: pageScrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              CupertinoSliverNavigationBar(
                backgroundColor:
                    CupertinoTheme.of(context).scaffoldBackgroundColor,
                border: null,
                stretch: true,
                largeTitle: Text(title),
                trailing: const ThemeToggleIconButton(),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: screenWidth(context) > 372
                    ? SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 100,
                          childAspectRatio: 1.6,
                        ),
                        delegate: SliverChildListDelegate(_infoBoxes),
                      )
                    : SliverList(
                        delegate: SliverChildListDelegate(
                          _infoBoxes.map(
                            (box) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: box,
                              );
                            },
                          ).toList(),
                        ),
                      ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverToBoxAdapter(
                  child: Material(
                    shape: RoundedRectangleBorder(borderRadius: defaultRadius),
                    color: CupertinoTheme.of(context).barBackgroundColor,
                    child: ListTile(
                      shape:
                          RoundedRectangleBorder(borderRadius: defaultRadius),
                      hoverColor: AppColors.blue.withOpacity(0.1),
                      onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) =>
                              MeasuresArticleScreen(peviousPageTitle: title),
                        ),
                      ),
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.blue,
                        child: Icon(
                          FlutterRemix.article_fill,
                          color: AppColors.white,
                        ),
                      ),
                      trailing: Icon(
                        FlutterRemix.external_link_line,
                        color: AppColors.blue.withOpacity(0.3),
                      ),
                      title: Text(
                        'Protective measures',
                        style: titleStyle(context),
                      ),
                      subtitle: Text(
                        'Protective measures against the COVID-19',
                        style: subtitleStyle(context),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Tracking',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle
                        .apply(fontSizeFactor: 0.75),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SliverTrackingList(),
            ],
          ),
        );
      },
    );
  }
}
