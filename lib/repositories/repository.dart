import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_services.dart';

class Repository {
  String apiKey = "afa222be30945d9c955affcf9546a842";
  late final ApiServices apiServices;
  
  Repository(this.apiServices);
  Future<WeatherModel> getWeather({required String cityName}) async {
    var response = await apiServices.getWeather(cityName, apiKey,"metric");
    // return WeatherModel.fromJson(response.toJson());
    return response;
  }
}
