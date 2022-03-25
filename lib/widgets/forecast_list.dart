import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/providers/weather_provider.dart';
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
    return FutureBuilder(
        future: Provider.of<WeatherProvider>(context)
            .getWeekForecast(widget.position),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data);
            List<Weather> a = snapshot.data as List<Weather>;
            return FractionallySizedBox(
              heightFactor: 0.4,
              child: ListView.builder(
                   physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: ((context, index) {
                    return LimitedBox(
                      child: DailyWeather(weather: a[index]),
                      maxWidth: 250,
                    );
                  })),
            );
          } else {
            return Text('loading');
          }
        });
  }
}
