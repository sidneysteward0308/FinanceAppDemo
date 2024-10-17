import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(context) {
    return Container(
      height: 80,
      width: 400,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10,),
          Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Organization",
                style: GoogleFonts.lato(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900),
              ),
              Text(
                "Organization",
                style: GoogleFonts.lato(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          SizedBox(width: 180,),
          Text(
            "\$30",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
