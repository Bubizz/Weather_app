

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/providers/location_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast/providers/weather_provider.dart';




class WeatherDisplayer extends StatefulWidget {
  const WeatherDisplayer({ Key? key }) : super(key: key);

  @override
  State<WeatherDisplayer> createState() => _WeatherDisplayerState();
}

class _WeatherDisplayerState extends State<WeatherDisplayer> {

  late Future<Position> a;


  @override
  void initState() {
    a = Provider.of<LocationProvider>(context, listen: false).position;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: FutureBuilder<Position>(
          future: a,
          builder: (_, AsyncSnapshot<Position> snapshot) 
          {
            if(snapshot.connectionState == ConnectionState.waiting)
            {
              return CircularProgressIndicator.adaptive();
            }
            else
            {
              return FutureBuilder(
                future: Provider.of<WeatherProvider>(context).getCurrentWeather(snapshot.data),
                builder: (_, AsyncSnapshot<Weather> snapshot) 
                {
                  if(snapshot.connectionState == ConnectionState.waiting)
                  {
                    
                    return Text('loading');
                    
                  }
                  else if(snapshot.hasData)
                  {
                    return Text(snapshot.data.toString());
                  }
                  else 
                  {
                    return Text('gepe');
                  }
                }
              );
            }
    
          },
         ),
      ),
    );
  }
}