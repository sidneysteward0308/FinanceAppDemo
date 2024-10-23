import 'package:flutter/material.dart';
import 'package:foxhole/util/g_nav.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() {
    return _IncomeScreenState();
  }
}

class _IncomeScreenState extends State<IncomeScreen> {
  void getIncome() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 15, left: 15, right: 15),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
      bottomNavigationBar:const CustomGNav(),
    );
  }
}
