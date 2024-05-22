import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_bloc/blocs/tema_blocs/tema_bloc.dart';
import 'package:flutter_weather_app_with_bloc/blocs/weather_blocs/weather_bloc.dart';
import 'package:flutter_weather_app_with_bloc/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(BlocProvider<TemaBloc>(
    create: (context) => TemaBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemaBloc, TemaState>(
      bloc: BlocProvider.of<TemaBloc>(context),
      builder: (context, TemaState state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: (state as UygulamaTemasi).theme,
          home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(),
            child: const WeatherApp(),
          ),
        );
      },
    );
  }
}
