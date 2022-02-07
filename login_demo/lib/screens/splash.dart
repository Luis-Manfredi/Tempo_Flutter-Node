import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_demo/colors.dart';
import 'package:login_demo/screens/welcome.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Splash> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 4), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [darkBlue, black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        alignment: Alignment.center,
        child: Container(
          child: Image.asset('assets/images/Tempo_White.png', height: 80)
        ),
      ),
    );
  }
}
