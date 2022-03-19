import 'package:geolocator/geolocator.dart';


class Location
{
  static Future<Position> locateUser() async
  {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
   
    return Future.error('Location services are disabled.');
  }
    var checkPermission = await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    
    if(checkPermission == LocationPermission.denied)
    {
      await Geolocator.requestPermission();
    }
    if(checkPermission!=LocationPermission.denied)
    {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      return position;
    }
    else
    {
      return Future<Position>.error('no permsission');
    }

    

  }
}