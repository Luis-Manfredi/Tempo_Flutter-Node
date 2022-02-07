import 'package:flutter/material.dart';
import 'package:login_demo/colors.dart';
import 'package:login_demo/components/form.dart';
import 'package:login_demo/components/media_access_button.dart';
import 'package:login_demo/text_manager.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String text = 'Welcome back to Tempo! If you don\'t have an account, you should sign up first.';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: whiteSmoke,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp, size: 30, color: darkBlue),
          onPressed: () => Navigator.pop(context),
        ),
        shadowColor: Colors.transparent,
      ),

      body: Stack(
        alignment: Alignment.center,
        children: [

          Positioned(
            top: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 100,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Log In', style: titleBold),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(text, style: description),
                  )
                ],
              ),
            ) 
          ),

          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              height: size.height * 0.7,
              width: size.width,
              decoration: const BoxDecoration(
                 gradient: LinearGradient(
                  colors: [darkBlue, black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )
              ),


              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: size.height * 0.35,
                    child: const MyForm(),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),

                        // MediaAccessButton(
                        //   size: size, 
                        //   icon: const Icon(FontAwesomeIcons.google, color: Colors.redAccent, size: 28), 
                        //   text: 'Continue with Google'
                        // ),

                        // MediaAccessButton(
                        //   size: size, 
                        //   icon: const Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 28), 
                        //   text: 'Continue with Facebook'
                        // ),

                        Image.asset('assets/images/Tempo_White.png', height: 40)

                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

