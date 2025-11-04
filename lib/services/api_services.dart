import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/models/weather_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5/')
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @GET('weather')
  Future<WeatherModel> getWeather(
    @Query('q') String cityName,
      @Query('appid') String apiKey,
      @Query('units') String units,
  );
}