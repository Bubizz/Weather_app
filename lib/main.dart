import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/screens/weather_displayer.dart';
import './providers/location_provider.dart';
import './providers/weather_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider()),
        ChangeNotifierProvider(
          create: (_) => LocationProvider(),
          )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(246, 62, 175, 228),
                  Color.fromARGB(248, 20, 145, 194),
                  Color.fromARGB(250, 27, 63, 129)
                ],
              ),
            ),
            child: const WeatherDisplayer(),
            
          ),
        ),
      ),
      
    );
  }
}
