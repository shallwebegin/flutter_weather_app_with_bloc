import 'dart:convert';
import 'package:flutter_weather_app_with_bloc/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://api.collectapi.com';
  final http.Client httpClient = http.Client();
  Future<Weather> fetchWeatherData(String sehirAdi) async {
    final havaDurumuUrl = await http.get(
      Uri.parse('$baseUrl/weather/getWeather?data.lang=tr&data.city=$sehirAdi'),
      headers: {
        'authorization': 'apikey 1bWis8yXtIzdbBv9B377Qr:3vkZa1VixWRyRHopfxbBht',
        'content-type': 'application/json',
      },
    );
    if (havaDurumuUrl.statusCode != 200) {
      throw Exception('Veri Getirilemedi');
    }
    final gelenCevapJson = jsonDecode(havaDurumuUrl.body);
    return Weather.fromJson(gelenCevapJson);
  }
}
