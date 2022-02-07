import 'package:flutter/material.dart';
import 'package:login_demo/screens/splash.dart';
import 'package:login_demo/screens/welcome.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu'
      ),
    );
  }
}

