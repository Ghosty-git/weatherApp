// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({
    required this.weatherModel,
  });
  
}

class WeatherLoadingState extends WeatherState{

}

class WeatherErrorState extends WeatherState {
  final CatchException error;
  WeatherErrorState({
    required this.error,
  });
  
}
