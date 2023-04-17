import 'package:injectable/injectable.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

@injectable
class UseWeatherCase{
  final WeatherRepository weatherRepository;
  
  UseWeatherCase({required this.weatherRepository});

  Future<WeatherModel> getWeather(String city) async => await weatherRepository.getWeather(city);
  
}