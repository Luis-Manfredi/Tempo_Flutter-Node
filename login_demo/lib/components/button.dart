import 'package:flutter/material.dart';
import 'package:login_demo/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({ Key? key, 
  required this.textColor, 
  required this.backgroundColor, 
  required this.text, 
  required this.function,
  required this.width, 
  required this.textSize }) : super(key: key);

  final Color textColor;
  final Color backgroundColor;
  final String text;
  final VoidCallback function;
  final double width;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function, 
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Text(text, style: TextStyle(color: textColor, fontSize: textSize)),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2)
            )
          ]
        ),
      ),

      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
    );
  }
}