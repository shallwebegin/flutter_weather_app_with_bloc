import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_with_bloc/blocs/weather_blocs/bloc/weather_bloc.dart';
import 'package:flutter_weather_app_with_bloc/widget/hava_durumu_resim.dart';
import 'package:flutter_weather_app_with_bloc/widget/location_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/max_min_sicaklik_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/sehir_sec.dart';
import 'package:flutter_weather_app_with_bloc/widget/son_guncelleme_widget.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    String kullanicininSectigiSehir = 'Edirne';
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    Completer<void> _refreshCompleter = Completer();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () async {
                kullanicininSectigiSehir = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SehirSec(),
                  ),
                );
                debugPrint('Secilen Sehir :  $kullanicininSectigiSehir');
                weatherBloc
                    .add(FetchWeatherEvent(sehirAdi: kullanicininSectigiSehir));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: weatherBloc,
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const Center(
                child: Text('Şehir Seçiniz'),
              );
            } else if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoadedState) {
              final getirilenWeather = state.weather;
              _refreshCompleter.complete();
              _refreshCompleter = Completer();
              return RefreshIndicator(
                onRefresh: () {
                  weatherBloc.add(
                      RefreshWeatherEvent(sehirAdi: kullanicininSectigiSehir));
                  return _refreshCompleter.future;
                },
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: LocationWidget(
                          secilenSehir: getirilenWeather.city ?? '',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: SonGuncellemeWidget()),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: HavaDurumuResimWidget()),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: MaxveMinSicaklikWidget()),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('Hata oluştu'),
              );
            }
          },
        ),
      ),
    );
  }
}
