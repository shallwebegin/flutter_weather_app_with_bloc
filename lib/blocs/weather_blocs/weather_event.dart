part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final String sehirAdi;

  const FetchWeatherEvent({required this.sehirAdi});

  @override
  List<Object> get props => [sehirAdi];
}

class RefreshWeatherEvent extends WeatherEvent {
  final String sehirAdi;

  const RefreshWeatherEvent({required this.sehirAdi});

  @override
  List<Object> get props => [sehirAdi];
}
