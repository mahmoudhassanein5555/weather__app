import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/repositories/repository.dart';
import 'package:weather_app/services/api_services.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<WeatherModel>? weather;
  @override
  void initState() {
    super.initState();

    Dio dio = Dio();
    ApiServices apiServices = ApiServices(dio);
    Repository repository = Repository(apiServices);
    weather = repository.getWeather(cityName: "Qaha");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF642FF1),
        
      ),
      body: FutureBuilder(
        future: weather,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final Weather = snapshot.data!;
            return Container(
              color: Color(0xFF642FF1),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "${Weather.name}",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "${Weather.weather[0].description}",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Container(
                      height: 220,
                      width: 220,
                      child: Image.network(
                        fit: BoxFit.contain,
                        "https://openweathermap.org/img/wn/${Weather.weather[0].icon}.png",
                      ),
                    ),
                    Text(
                      "${Weather.main.temp} °C",
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w900,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 110,
                              width: 90,
                              child: Image.asset("lib/images/cloudeIcon.png"),
                            ),
                            SizedBox(height: 1),
                            Text(
                              "${Weather.clouds.all} %",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 100,
                              width: 90,
                              child: Image.asset(
                                fit: BoxFit.cover,
                                "lib/images/windIcon.png",
                              ),
                            ),
                            SizedBox(height: 9),
                            Text(
                              "${Weather.wind.speed} m/s",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 110,
                              width: 90,
                              child: Image.asset("lib/images/airpressure.png"),
                            ),
                            Text(
                              "${Weather.main.pressure} %",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 110,
                              width: 90,
                              child: Image.asset("lib/images/eye icon.png"),
                            ),
                            Text(
                              "${Weather.visibility} Km",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(112, 25, 50, 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Maxtemp: ${Weather.main.temp_max} °C",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 255, 115, 0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "Mintemp: ${Weather.main.temp_min} °C",
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    232,
                                    232,
                                    10,
                                  ),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: Text("No Weather Data For This City"));
          }
        },
      ),
    );
  }
}
