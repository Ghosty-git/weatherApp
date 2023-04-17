import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_use_case.dart';
import 'package:weather_app/internal/helpers/catch_exception.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final UseWeatherCase useCase;
  WeatherBloc(this.useCase) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});

    on<GetWeatherEvent>(
      (event, emit) async {
        emit(WeatherLoadingState());
        await useCase
            .getWeather(event.city)
            .then(
              (weatherModel) => emit(
                WeatherLoadedState(weatherModel: weatherModel),
              ),
            )
            .onError(
              (error, stackTrace) => emit(
                WeatherErrorState(
                  error: CatchException.convertException(error),
                ),
              ),
            );
      },
    );
  }
}
