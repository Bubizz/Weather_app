import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:intl/intl.dart';



class DailyWeather extends StatelessWidget {
  const DailyWeather({ Key? key, required this.weather, required this.date }) : super(key: key);
  final Weather weather;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(
         children: [
          Column(children: [Image.asset('assets/images/'+weather.image +'.png'), Text(weather.description, style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14)) ]),
         
          Column(children: [Text(DateFormat('EEEE, d MMM').format(date), style: const TextStyle(fontSize: 16),), const Spacer(),  Text(weather.temp.toString() + ' C°'), const Spacer(), Text(weather.windspeed.toStringAsFixed(2) + ' m/s'), const Spacer()], crossAxisAlignment: CrossAxisAlignment.center,)
         ],
       ),
     )
    );
  }
}