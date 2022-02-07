import 'package:flutter/material.dart';
import 'package:login_demo/components/button.dart';
import 'package:login_demo/colors.dart';
import 'package:login_demo/screens/login.dart';
import 'package:login_demo/screens/signup.dart';
import 'package:login_demo/text_manager.dart';

class Welcome extends StatelessWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String intro = 'Explore your favorites artist with our library of 80 millions tracks. Tempo offers great deals to give you comfort when you are listening to your favorite music.';

    navLogin(){
      return Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
    }

    navSignup(){
      return Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: size.height * 0.7,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [darkBlue, black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              alignment: Alignment.center,
              child: Image.asset('assets/images/Tempo_White.png', height: 80)
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              height: size.height * 0.4,
              width: size.width,
              decoration: const BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                )
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome!', style: titleBold),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(intro, style: description, textAlign: TextAlign.justify)
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          textColor: whiteSmoke, 
                          textSize: 14,
                          width: 140,
                          backgroundColor: darkBlue, 
                          text: 'Sign Up', 
                          function: navSignup
                        ),
                        CustomButton(
                          textColor: darkBlue,
                          textSize: 14,
                          width: 140, 
                          backgroundColor: whiteSmoke, 
                          text: 'Log In', 
                          function: navLogin
                        )
                      ],
                    ),
                  )
                ],
              ),
            ) 
          )

        ] 
      ),
    );
  }
}