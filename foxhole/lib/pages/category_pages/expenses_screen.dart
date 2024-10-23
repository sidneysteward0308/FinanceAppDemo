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
     return const Scaffold(
      bottomNavigationBar: CustomGNav()
     );
  }
}
