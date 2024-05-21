import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_bloc/blocs/weather_blocs/bloc/weather_bloc.dart';
import 'package:flutter_weather_app_with_bloc/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            actionsIconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 32)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(),
        child: const WeatherApp(),
      ),
    );
  }
}
