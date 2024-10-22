import 'package:flutter/material.dart';
import 'package:foxhole/util/g_nav.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(context) {
     return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: CustomGNav(),
        ),
      ),
     );
  }
}
