import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/providers/location_provider.dart';
import 'package:weather_forecast/widgets/forecast_list.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast/widgets/animated_loading.dart';
import 'package:weather_forecast/providers/weather_provider.dart';
import '../widgets/weather_presenter.dart';

class WeatherDisplayer extends StatefulWidget {
  const WeatherDisplayer({Key? key}) : super(key: key);

  @override
  State<WeatherDisplayer> createState() => _WeatherDisplayerState();
}

class _WeatherDisplayerState extends State<WeatherDisplayer> {
  late Future<Position> location;

  @override
  void initState() {
    location = Provider.of<LocationProvider>(context, listen: false).position;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: Provider.of<WeatherProvider>(context)
                .getCurrentWeather(location),
            builder: (_, AsyncSnapshot<Weather> snapshot2) {
              if (snapshot2.connectionState == ConnectionState.waiting) {
                return ForecastList(position: location);
              } else if (snapshot2.hasData) {
                return 
                
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          WeatherPresenter(weather: snapshot2.data!),
                          ForecastList(position: location),
                        ],
                      ),
                    );
                  
                
              } else {
                return const AnimatedLoader(text: 'Fetching weather');
              }
            }));
  }
}
