import 'package:flutter/material.dart';
import 'package:login_demo/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: whiteSmoke)),
        backgroundColor: darkBlue,
      ),

      body: const Center(
        child: Text('Welcome to Tempo!', style: TextStyle(fontSize: 28)),
      ),
    );
  }
}
