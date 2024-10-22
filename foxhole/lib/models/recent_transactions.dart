import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentTransactionTiles extends StatelessWidget {


 final String companyName;
  final String transactionStatus;
  final double transactionAmount;

  const RecentTransactionTiles ({super.key, required this.companyName,
      required this.transactionStatus,
      required this.transactionAmount});

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
          const SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  companyName,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900),
                ),
                     
                Text(
                  transactionStatus,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(width: 165,),
          Text(
            "\$$transactionAmount",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
