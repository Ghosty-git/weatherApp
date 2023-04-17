// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart'
    as _i4;
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart'
    as _i3;
import 'package:weather_app/features/weather/domain/use_cases/weather_use_case.dart'
    as _i5;
import 'package:weather_app/features/weather/presentation/logic/bloc/weather_bloc.dart'
    as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.WeatherRepository>(() => _i4.WeatherRepositoryImpl());
  gh.factory<_i5.UseWeatherCase>(
      () => _i5.UseWeatherCase(weatherRepository: gh<_i3.WeatherRepository>()));
  gh.factory<_i6.WeatherBloc>(() => _i6.WeatherBloc(gh<_i5.UseWeatherCase>()));
  return getIt;
}
