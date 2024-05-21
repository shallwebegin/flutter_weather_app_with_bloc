part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  const WeatherLoadedState({required this.weather});
  final Weather weather;
  @override
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {}
