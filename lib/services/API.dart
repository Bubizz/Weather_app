import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

import 'APIkey.dart';


class API
{

  static const String host = 'api.weatherbit.io';

  static const String basePath = 'v2.0';

  Future<Map<String, dynamic>> fetchData(Position userLocation, String resourcePath) async
  {
    
    var url = Uri(
    scheme: 'http',
    host: host,
    path: basePath + resourcePath,
    queryParameters: {'lat' : userLocation.latitude.toString(), 'lon' : userLocation.longitude.toString(), 'key' : APIkey.apikey, 'lang' : 'en'}
  );

  var response = await http.get(url);
  
  if(response.statusCode == 200)
  {
    var map = jsonDecode(response.body);
    return map['data'][0];

  }
  else
  {
    return Future.error(Error());
  }
    
  
  }











}