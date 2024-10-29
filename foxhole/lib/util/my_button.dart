import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

 const MyButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color.fromRGBO(2, 48, 71, 1),
      child: Text(buttonName, style: const TextStyle(color: Color.fromARGB(255, 230, 229, 229)),),
    );
  }
}
