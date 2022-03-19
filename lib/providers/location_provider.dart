
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
class LocationProvider with ChangeNotifier
{
  Future<Position> position;

  LocationProvider() : position= Location.locateUser();
  

 



}