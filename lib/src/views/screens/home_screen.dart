import 'package:covid/src/logic/blocs/countries_bloc/countries_bloc.dart';
import 'package:covid/src/logic/brightness_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen([Key? key]) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountriesBloc, CountriesState>(
      listener: (context, state) {
        print(state.status);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.surfing),
              onPressed: () => BlocProvider.of<BrightnessCubit>(context).toggle,
            ),
          ),
          body: ListView.builder(
            itemCount: state.countries.length,
            itemBuilder: (context, index) {
              var country = state.countries[index];
              return ListTile(
                title: Text(country.name),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(country.flagURL!),
                ),
                subtitle: Text('Total cases: ${country.cases}'),
              );
            },
          ),
        );
      },
    );
  }
}
