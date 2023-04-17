// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String city;
  GetWeatherEvent({
    required this.city,
  });
}
