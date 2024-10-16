import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryContainer extends StatelessWidget {
  final double categoryAmount;
  final int categoryPercent;
  final String categoryName;
  final String categoryImagePath;
  // VoidCallback onPressed;

CategoryContainer(
      {super.key,
      required this.categoryAmount,
      required this.categoryPercent,
      required this.categoryName,
      required this.categoryImagePath});

  @override

  //we need to figure out how to implement hero, or use inkwell to help open the pages.
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 115,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              children: [
                Text(
                  "\$$categoryAmount",
                  style: GoogleFonts.lato(
                      fontSize: 14, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  width: 60,
                ),
                Text(
                  "$categoryPercent\%",
                  style: GoogleFonts.lato(
                      fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child:
                Align(alignment: Alignment.topLeft, child: Text(categoryName)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image(
                image: AssetImage("$categoryImagePath"),
                height: 50,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
