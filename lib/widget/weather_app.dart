import 'package:flutter/material.dart';
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
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: LocationWidget(
                  secilenSehir: kullanicininSectigiSehir,
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
      ),
    );
  }
}
