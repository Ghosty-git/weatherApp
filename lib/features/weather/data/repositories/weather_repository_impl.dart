import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/internal/helpers/api_requester.dart';
import 'package:weather_app/internal/helpers/catch_exception.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository{
  @override
  Future<WeatherModel> getWeather(String city) async {
    ApiRequester apiRequester = ApiRequester();

       try {
      Response response = await apiRequester.toGet("weather", param:{
        "q": city,
        "lang":"ru",
        "appid":"d0617a5c2dca461ecff826af2453a679"
      });
      log("user response === ${response.data}");

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      }

      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}