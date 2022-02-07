import 'package:flutter/material.dart';
import 'package:login_demo/colors.dart';
import 'package:login_demo/components/form2.dart';
import 'package:login_demo/text_manager.dart';

class Signup extends StatelessWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String text = 'Hello there! Join Tempo to discover amazing tracks, talented artist and interesting podcast.';

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
            top: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 110,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sign up', style: titleBold),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
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
                  const MyForm2(),

                  Image.asset('assets/images/Tempo_White.png', height: 40)
                ],
              ),
            )
          )

        ],
      ),
    );
  }
}