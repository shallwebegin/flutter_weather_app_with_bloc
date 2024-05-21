import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_with_bloc/blocs/weather_blocs/bloc/weather_bloc.dart';

class SonGuncellemeWidget extends StatelessWidget {
  const SonGuncellemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      builder: (context, state) {
        return Text(
          'Son Güncelleme ${(state as WeatherLoadedState).weather.result![0].date}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
