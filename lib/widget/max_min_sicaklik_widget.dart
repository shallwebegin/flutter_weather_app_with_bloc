import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_with_bloc/blocs/weather_blocs/weather_bloc.dart';

class MaxveMinSicaklikWidget extends StatelessWidget {
  const MaxveMinSicaklikWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Maksimum  :${(state as WeatherLoadedState).weather.result![0].max}°C',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Minimum  :${(state).weather.result![0].min}°C',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        );
      },
    );
  }
}
