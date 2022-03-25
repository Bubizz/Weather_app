import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather.dart';


class DailyWeather extends StatelessWidget {
  const DailyWeather({ Key? key, required this.weather }) : super(key: key);
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Card(
     child: Column(
       children: [
         Row(children: [Image.asset('assets/images/'+weather.image +'.png'), const Spacer(), Text(weather.description),]),
         Row(children: [Text(weather.description), Text(weather.temp.toString())])
       ],
     )
    );
  }
}