import 'package:flutter/foundation.dart';
import '../models/weather.dart';
import 'package:geolocator/geolocator.dart';
import '../services/API.dart';
import 'dart:async';

class WeatherProvider with ChangeNotifier {
  final api = API();

  static String currentPath = '/current/';

  static String weekPath = '/forecast/daily';

  Future<Weather> getCurrentWeather(Future<Position> userLocation) async {
    var position = await userLocation;
    var weather = await api.fetchWeather(position, currentPath);
    return Weather.fromJson(weather);
  }
   Future<List<Weather>> getWeekForecast(Future<Position> userLocation) async {
    var position = await userLocation;
    var weather = await api.fetchForecast(position, weekPath);
    for(int i = 0; i <=15; i++)
    {
        
    weather[i]["city_name"] = "Poznań";


  
    }

  

    var list = List<Weather>.generate(15, (index) {print(weather[index]['temp']);print(weather[index]['ob_time']) ;print(weather[index]['weather']['icon']); print( weather[index]['weather']['description']); return Weather.fromJson(weather[index]); });
    
    return list;
    
  
  }
}
