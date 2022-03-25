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
    
    var dailyWeatherList = List<Weather>.generate(15, (index) => Weather.fromJson(weather[index]));


    
    return dailyWeatherList;
    
  
  }
}
