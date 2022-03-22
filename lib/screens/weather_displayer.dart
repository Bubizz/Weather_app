import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/providers/location_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast/widgets/animated_loading.dart';
import 'package:weather_forecast/providers/weather_provider.dart';

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
      child: FutureBuilder<Position>(
        future: location,
        builder: (_, AsyncSnapshot<Position> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('unable to get location'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: AnimatedLoader());
          } else {
            return FutureBuilder(
                future: Provider.of<WeatherProvider>(context)
                    .getCurrentWeather(snapshot.data),
                builder: (_, AsyncSnapshot<Weather> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const AnimatedLoader();
                        
                  } else if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  size: 30,
                                ),
                                Text(snapshot.data!.city,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            color: Colors.black, fontSize: 30)),
                              ]),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              const Spacer(
                                flex: 1,
                              ),
                              Image.asset('assets/images/' +
                                  snapshot.data!.image +
                                  '.png'),
                              const Spacer(flex: 2),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    snapshot.data!.temp.toString() + '°C',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(snapshot.data!.description),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              const Spacer(
                                flex: 1,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return Text('Unable to get weather');
                  }
                });
          }
        },
      ),
    );
  }
}
