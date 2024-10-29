import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String actionText;
  final Color? optionColor;

  const SettingsContainer({super.key, required this.onPressed, required this.icon, required this.actionText, required this.optionColor});

  @override
  Widget build(context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 239, 239, 239),
        ),
        width: 350,
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: optionColor,),
            const SizedBox(width: 10,),
            Text(
              actionText,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: optionColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
