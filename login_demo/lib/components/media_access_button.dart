import 'package:flutter/material.dart';
import 'package:login_demo/colors.dart';

class MediaAccessButton extends StatelessWidget {
  const MediaAccessButton({
    Key? key,
    required this.size, required this.icon, required this.text,
  }) : super(key: key);

  final Size size;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: whiteSmoke
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5, 4, 5, 6),
            child: icon
          ),

          Text(text),

          const Icon(Icons.arrow_forward_sharp)
        ],
      ),
    );
  }
}