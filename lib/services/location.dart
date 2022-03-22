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
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
   
      return position;
    }
    else
    {
      return Future.error('no permsission');
    }

    

  }
}