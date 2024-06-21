import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:fesste/presentation/homescreen/bloc/home_bloc.dart';
import 'package:fesste/presentation/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
 const   Splash({super.key});

  @override
  Widget build(BuildContext context) {
  context.read<HomeBloc>().add(FetchNames());
  final screenwidth = MediaQuery.of(context).size.width;
  final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: Colors.red[700],
      body:FlutterSplashScreen.scale(
        animationDuration: const Duration(seconds: 4),
        duration:const  Duration(seconds: 5),
          backgroundColor: Colors.red,
          childWidget: SizedBox(
            height: screenwidth*0.7,
            width: screenheight*0.7,
            child: Image.asset("asset/Tomato (1).png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: HomeScreen(),
        ),
    ) ;
  }
}