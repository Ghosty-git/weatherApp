import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/logic/bloc/weather_bloc.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:weather_app/internal/dependecies/get_it.dart';
import 'package:weather_app/internal/helpers/utils.dart';

class WeatherInfoScreen extends StatefulWidget {
  final String city;
  const WeatherInfoScreen({
    super.key,
    required this.city,
  });

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  // late String city;
  late WeatherBloc bloc;
  Color backgroundColor = Colors.red;
  String weatherIcon = '';

  @override
  void initState() {
    bloc = getIt<WeatherBloc>();
    bloc.add(GetWeatherEvent(city: widget.city));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: BlocConsumer<WeatherBloc, WeatherState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const CircularProgressIndicator();
          }

          if (state is WeatherLoadedState) {
            backgroundColor =
                backgroundHelper(state.weatherModel.weather?.first.main ?? '');
            weatherIcon = weatherImage(
                'https://openweathermap.org/img/wn/${state.weatherModel.weather!.first.icon}@4x.png');

            return Container(
              color: backgroundHelper(
                  state.weatherModel.weather?.first.main ?? ''),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      convertDate1(state.weatherModel.dt ?? 2),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      convertTime(state.weatherModel.timezone ?? 2),
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      state.weatherModel.name ?? "",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(weatherImage(
                          state.weatherModel.weather!.first.icon ?? ''), fit: BoxFit.cover,),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "${convertGradus(state.weatherModel.main?.temp ?? 0.0).toString()} °",
                      style: const TextStyle(color: Colors.white, fontSize: 45),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Text(
                        convertDay(state.weatherModel.dt ?? 0).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                        ),
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is WeatherErrorState){
            Container(child: Text(state.error.message.toString()),);
          }
          return Container();
        },
      ),
    );
  }
}
