import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/providers/weather_provider.dart';
import 'package:weather_forecast/widgets/animated_loading.dart';
import 'package:weather_forecast/widgets/daily_weather_listcard.dart';

class ForecastList extends StatefulWidget {
  final Future<Position> position;
  const ForecastList({Key? key, required this.position}) : super(key: key);

  @override
  State<ForecastList> createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {
  @override
  void initState() {
    Provider.of<WeatherProvider>(context, listen: false)
        .getWeekForecast(widget.position);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentDate = DateTime.now();
    return FutureBuilder(
        future: Provider.of<WeatherProvider>(context)
            .getWeekForecast(widget.position),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Weather> weatherList = snapshot.data as List<Weather>;
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.35 > 300 ? MediaQuery.of(context).size.height * 0.35 : 200,
            
              child: ListView.builder(
                   physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: ((context, index) {
                    var cardDate = currentDate.add(Duration(days: index+1));
                    print(cardDate);
                    return LimitedBox(
                      child: DailyWeather(weather: weatherList[index], date: cardDate,),
                      maxWidth: 310,
                    );
                  })),
            );
          } else {
            return const Center(child: AnimatedLoader(text: 'Predicting weather'));
          }
        });
  }
}
