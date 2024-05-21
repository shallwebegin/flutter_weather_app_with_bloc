import 'package:flutter_weather_app_with_bloc/data/weather_api_client.dart';
import 'package:flutter_weather_app_with_bloc/locator.dart';
import 'package:flutter_weather_app_with_bloc/models/weather_model.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String sehir) async {
    return await weatherApiClient.fetchWeatherData(sehir);
  }
}
