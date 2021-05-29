import 'package:covid/src/logic/bloc/blocs.dart';
import 'package:covid/src/logic/cubit/cubits.dart';
import 'package:covid/src/utils/styles.dart';
import 'package:covid/src/views/widgets/info_box.dart';
import 'package:covid/src/views/widgets/theme_toggle_icon_button.dart';
import 'package:covid/src/views/widgets/tracking_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix/flutter_remix.dart';

class GlobalScreen extends HookWidget {
  const GlobalScreen({required this.themeState, Key? key}) : super(key: key);

  final ThemeState themeState;

  @override
  Widget build(BuildContext context) {
    final pageScrollController = useScrollController(debugLabel: 'page');
    final gridScrollController = useScrollController(debugLabel: 'grid');
    final bodyScrollController = useScrollController(debugLabel: 'body');
    final trackingListController = useScrollController(debugLabel: 'track');

    return BlocConsumer<GeneralDataBloc, GeneralDataState>(
      listener: (context, state) {},
      builder: (context, state) => CupertinoPageScaffold(
        child: NestedScrollView(
          controller: pageScrollController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, isChildScrolled) => [
            CupertinoSliverNavigationBar(
              backgroundColor:
                  CupertinoTheme.of(context).scaffoldBackgroundColor,
              border: null,
              stretch: true,
              largeTitle: const Text('Global'),
              trailing: const ThemeToggleIconButton(),
            ),
          ],
          body: SafeArea(
            child: SingleChildScrollView(
              controller: bodyScrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    constraints: const BoxConstraints(
                      maxHeight: 240,
                      maxWidth: double.infinity,
                    ),
                    child: GridView.count(
                      controller: gridScrollController,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.6,
                      children: <InfoBox>[
                        InfoBox(
                          key: const Key('total'),
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
                      ],
                    ),
                  ),
                  Padding(
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
                  TrackingList(scrollController: trackingListController)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
