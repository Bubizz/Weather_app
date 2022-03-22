import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          textTheme: TextTheme(
            bodyText2: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 24, color: Colors.white))
          )
        ),
        home: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(246, 87, 183, 238),
                  Color.fromARGB(248, 108, 121, 235),
                  Color.fromARGB(248, 80, 92, 201),
                  Color.fromARGB(248, 55, 64, 145)
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
