import 'package:flutter/material.dart';
import 'package:login_demo/colors.dart';
import 'package:login_demo/components/button.dart';
import 'package:login_demo/screens/login.dart';
import 'package:login_demo/text_manager.dart';

class Success extends StatelessWidget {
  const Success({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [darkBlue, black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              const SizedBox(
                height: 40,
              ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle_outline_outlined, size: 120, color: yellow),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('User successfully registered', style: success)
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomButton(
                    textColor: darkBlue, 
                    backgroundColor: yellow, 
                    text: 'Continue', 
                    function: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                    }, 
                    width: size.width, 
                    textSize: 16
                  ),
                ),
              ],
            ),

            Image.asset('assets/images/Tempo_White.png', height: 40)
          ],
        )
      ),
    );
  }
}