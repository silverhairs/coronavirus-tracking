import 'package:covid/src/data/models/country/country.dart';
import 'package:covid/src/logic/cubit/cubits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverTrackingList extends StatelessWidget {
  const SliverTrackingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingCountryCubit, List<Country>>(
      builder: (context, trackingList) {
        if (trackingList.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Your tracking list is empty',
                style: TextStyle(
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var country = trackingList[index];
              return Text(country.name);
            },
            childCount: trackingList.length,
          ),
        );
      },
    );
  }
}
