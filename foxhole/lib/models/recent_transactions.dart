import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentTransactionTiles extends StatelessWidget {
  final String companyName;
  final String transactionStatus;
  final String transactionAmount;
  final String? currentDate;

  const RecentTransactionTiles({
    super.key,
    required this.companyName,
    required this.transactionStatus,
    required this.transactionAmount,
    required this.currentDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  transactionStatus,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                if (currentDate != null)
                  Text(
                    currentDate!,
                    style: GoogleFonts.lato(
                      color: Colors.grey[600],
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          ),
          Text(
            transactionAmount,
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
