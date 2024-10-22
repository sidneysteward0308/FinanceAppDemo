import 'package:flutter/material.dart';
import 'package:foxhole/models/recent_transactions.dart';
import 'package:foxhole/util/g_nav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({
    super.key,
  });

  @override
  State<WalletScreen> createState() {
    return _WalletScreenState();
  }
}

class _WalletScreenState extends State<WalletScreen> {
  double? userBalance;
  double? transactionAmount;

  void computeBalance() {} //will be used to populate transactions

  List transactions = [
    ["Netflix", "October 15th", "\$15"],
    ["HBO", "October 16th", "\$4.99"],
    ["Hulu", "October 17", "\$7.99"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        child: Container(
          padding:
              const EdgeInsets.only(top: 70, bottom: 15, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 140, right: 100),
                        child: Text(
                          "Wallet",
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Container(
                        width: 35,
                        height: 35,
                      
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: const Icon(Icons.add),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 16.0, bottom: 16, left: 20, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Current Balance"),
                    Text(
                      "\$10,0000",
                      style:
                          GoogleFonts.lato(fontSize: 40, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_downward,
                            color: Colors.black,
                          ),
                          label: Text(
                            'Deposit',
                            style: GoogleFonts.lato(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(170, 50),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_outward,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Widthdraw',
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 2, 48, 71),
                              minimumSize: Size(170, 50)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Transactions",
                  style: GoogleFonts.lato(color: Colors.black, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: const SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       RecentTransactionTiles(
                          companyName: "Netflix",
                          transactionStatus: "Completed",
                          transactionAmount: 22,
                        ),
                        SizedBox(
                          height: 4,
                        ),RecentTransactionTiles(
                          companyName: "Netflix",
                          transactionStatus: "Completed",
                          transactionAmount: 22,
                        ),
                        SizedBox(
                          height: 4,
                        ),RecentTransactionTiles(
                          companyName: "Netflix",
                          transactionStatus: "Completed",
                          transactionAmount: 22,
                        ),
                        SizedBox(
                          height: 4,
                        ),RecentTransactionTiles(
                          companyName: "Netflix",
                          transactionStatus: "Completed",
                          transactionAmount: 22,
                        ),
                        SizedBox(
                          height: 4,
                        ),RecentTransactionTiles(
                          companyName: "Netflix",
                          transactionStatus: "Completed",
                          transactionAmount: 22,
                        ),
                        SizedBox(
                          height: 4,
                        ),RecentTransactionTiles(
                          companyName: "Netflix",
                          transactionStatus: "Completed",
                          transactionAmount: 22,
                        ),
                        SizedBox(
                          height: 4,
                        ),RecentTransactionTiles(
                          companyName: "Netflix",
                          transactionStatus: "Completed",
                          transactionAmount: 22,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      /*make a class that has the Gnav bar and call it from all other classes,
      changes will only need to be made in one place.  Figure out is there is a better way
      to have the nav bar appear throughout the app*/
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: CustomGNav(),
        ),
      ),
    );
  }
}
