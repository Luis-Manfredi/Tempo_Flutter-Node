import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/colors.dart';
import 'package:login_demo/components/button.dart';
import 'package:login_demo/models/user_model.dart';
import '../screens/signup_success.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MyForm2 extends StatefulWidget {
  const MyForm2({ Key? key }) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<MyForm2> {

  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<User>? _futureUser;

  Future<User> createUser(String email, String username, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:4000/api/clients/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'username': username,
        'password': password
      }),
    );
    
    // print(response.body);

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));

    } else {
      throw Exception('Failed to create user.');
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
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: yellow)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red)
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,

        validator: (value) => !EmailValidator.validate(value!) ? 'Enter a valid email' : null
      ),
    );
  }

  Widget username(){
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: TextFormField(
        controller: _usernameController,
        style: const TextStyle(color: whiteSmoke),
        decoration: const InputDecoration(
          hintText: 'Insert an username',
          hintStyle: TextStyle(color: whiteSmoke),
          labelText: 'Username',
          labelStyle: TextStyle(color: yellow),
          alignLabelWithHint: true,
          prefixIcon: Icon(Icons.person, color: yellow),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: yellow)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: yellow)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: yellow)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red)
          ),
        ),

        validator: (value) => value!.isEmpty || value.length < 4 == true ? 'Must have at least 4 characters' : null,
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
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: yellow)
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red)
          ),
        ),

        validator: (value) => value!.isEmpty || value.length < 8 == true ? 'Must have at least 8 characters' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    loadingPrompt(BuildContext context){
      return showDialog(
        context: context, 
        builder: (context) {
          Future.delayed(const Duration(seconds: 4), (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Success()));
          });

          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(color: whiteSmoke),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Please wait', style: TextStyle(color: whiteSmoke, fontSize: 16, decoration: TextDecoration.none)),
                )
              ],
            ),
          );
        }
      );
    }

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            email(),
            username(),
            password(),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                textColor: darkBlue, 
                textSize: 18,
                width: size.width,
                backgroundColor: yellow, 
                text: 'Sign Up', 
                function: (){
                  final form = _formKey.currentState!;
                  if (form.validate()){
                    loadingPrompt(context);

                    createUser(_emailController.text, _usernameController.text, _passwordController.text);

                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}