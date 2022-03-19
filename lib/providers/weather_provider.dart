import 'package:flutter/foundation.dart';
import '../models/weather.dart';
import 'package:geolocator/geolocator.dart';
import '../services/API.dart';

class WeatherProvider with ChangeNotifier
{
 
  final api = API();

  static String path = '/current/';


  Future<Weather> getCurrentWeather(Position? userLocation) async
  {
    var weather = await api.fetchData(userLocation, path);

    print(weather['data'][0]['city_name']);

    return Weather.fromJson(weather);
  }






  
 
}