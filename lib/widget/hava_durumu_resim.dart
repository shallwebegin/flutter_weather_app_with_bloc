import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_with_bloc/blocs/weather_blocs/weather_bloc.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  const HavaDurumuResimWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Column(
          children: [
            Text(
              '${(state as WeatherLoadedState).weather.result![0].degree} °C',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Image.network(
              '${(state as WeatherLoadedState).weather.result![0].icon}',
              height: MediaQuery.of(context).size.height / 4,
            ),
          ],
        );
      },
    );
  }
}
