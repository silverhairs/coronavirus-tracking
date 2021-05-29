import 'package:covid/src/data/models/country/country.dart';
import 'package:covid/src/logic/cubit/cubits.dart';
import 'package:covid/src/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingList extends StatelessWidget {
  const TrackingList({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingCountryCubit, List<Country>>(
      builder: (context, trackingList) {
        if (trackingList.isEmpty) {
          return const SizedBox(
            height: 200,
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
        return Container(
          height: screenHeight(context),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            controller: scrollController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trackingList.length,
            itemBuilder: (context, index) {
              var country = trackingList[index];
              return Text(country.name);
            },
          ),
        );
      },
    );
  }
}
