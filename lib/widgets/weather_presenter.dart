import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherPresenter extends StatefulWidget {
 WeatherPresenter({Key? key, required this.weather}) : super(key: key);

  final Weather weather;

  @override
  State<WeatherPresenter> createState() => _WeatherPresenterState();
}

class _WeatherPresenterState extends State<WeatherPresenter> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin:  const Offset(1.5, 1.5),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.1;
  
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 30),
        child: SlideTransition(
          position: _offsetAnimation,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        size: 30,
                      ),
                      Text(widget.weather.city,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black, fontSize: 30)),
                    ]),
                const SizedBox(height: 30),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/' + widget.weather.image + '.png',
                          ),
                          Text(widget.weather.description),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 4,
                        child: FittedBox(
                          alignment: Alignment.center,
                          fit:BoxFit.contain,
                      
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.weather.temp.toInt().toString() + ' °C',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(height: 10,),
                             
                                Text(widget.weather.windspeed.toStringAsFixed(2) + ' m/s'),
                                const SizedBox(height: 10,),
                                const Text('last updated:'),
                          
                                  
                               
                                Text(widget.weather.timeStamp),
                              ],
                            ),
                          
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  
  }
}

/*
Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.location_pin,
              size: 30,
            ),
            Text(weather.city,
                style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontSize: 30)),
          ]),
          const SizedBox(height: 30),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Image.asset('assets/images/' + weather.image + '.png'),
                const Spacer(flex: 2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.temp.toInt().toString() + '°C',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(weather.description),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
    */

