import 'package:flutter/material.dart';
import 'package:login_demo/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_demo/components/button.dart';
import 'package:login_demo/screens/home.dart';

class MyForm extends StatefulWidget {
  const MyForm({ Key? key }) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<MyForm> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;
  bool authApproved = false;
  List? jsonUser;

  errorPrompt(BuildContext context){
      return showDialog(
        context: context, 
        builder: (context){
          return Container(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 120,
              width: 250,
              decoration: const BoxDecoration(
                color: whiteSmoke,
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Login error. Try again.', 
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 18
                    )
                  ),

                  CustomButton(
                    textColor: yellow, 
                    backgroundColor: darkBlue, 
                    text: 'Close', 
                    function: (){
                      Navigator.pop(context);
                    }, 
                    width: 200, 
                    textSize: 16
                  )
                ],
              ),
            )
          );
        }
      );
    }

  getUser(String email, String password, BuildContext context) async {

    final response = await http.get(Uri.parse('http://localhost:4000/api/clients/login/${email}&${password}'));

    if (response.statusCode == 200){
      jsonUser = json.decode(response.body);
      
      setState(() {
        authApproved = true; 
      });

      return Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
    }
    else{
      errorPrompt(context);
      throw Exception('User not found!');
    }
  }

  Widget email(){
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: TextFormField(
        controller: _emailController,
        style: const TextStyle(color: whiteSmoke),
        decoration: const InputDecoration(
          hintText: 'Insert an email',
          hintStyle: TextStyle(color: whiteSmoke),
          labelText: 'Email',
          labelStyle: TextStyle(color: yellow),
          alignLabelWithHint: true,
          prefixIcon: Icon(Icons.mail_outline_rounded, color: yellow),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: yellow)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: yellow)
          )
        ),
      ),
    );
  }

  Widget password(){
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: isObscure,
        style: const TextStyle(color: whiteSmoke),
        decoration: InputDecoration(
          hintText: 'Insert a password',
          hintStyle: const TextStyle(color: whiteSmoke),
          labelText: 'Password',
          labelStyle: const TextStyle(color: yellow),
          alignLabelWithHint: true,
          prefixIcon: const Icon(Icons.lock_outline_rounded, color: yellow),
          suffixIcon: IconButton(
            icon: const Icon(Icons.remove_red_eye_sharp, color: yellow),
            onPressed: (){
              if (isObscure == true){
                setState(() {
                  isObscure = false;
                });
              }
              else{
                setState(() {
                  isObscure = true;
                });
              }
            },
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: yellow)
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: yellow)
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                email(),
                password(),
              ],
            ),

            const Text('Forgot your password?', style: TextStyle(color: whiteSmoke)),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                textColor: darkBlue, 
                textSize: 18,
                width: size.width,
                backgroundColor: yellow, 
                text: 'Log In', 
                function: (){
                  getUser(_emailController.text, _passwordController.text, context);
                }
              ),
            ),
          ],
        ),
      )
    );
  }
}