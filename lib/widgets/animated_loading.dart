
import 'package:flutter/material.dart';

class AnimatedLoader extends StatefulWidget {
  const AnimatedLoader({ Key? key }) : super(key: key);

  @override
  State<AnimatedLoader> createState() => _AnimatedLoaderState();
}

class _AnimatedLoaderState extends State<AnimatedLoader> with TickerProviderStateMixin{
  late AnimationController _controller;
  late CurvedAnimation _animation;

  @override void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3), )..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    super.initState();
  }

  @override void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
      height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RotationTransition(
              alignment: Alignment.center,
              child: Image.asset('assets/images/sun3.png', width: 70, height: 70,),
              turns: _animation,        
            ),
            const Text('We are trying to find you'),
         
          ],
        ),
      ),
    );
    
  }
}