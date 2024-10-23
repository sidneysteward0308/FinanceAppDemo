import 'package:flutter/material.dart';
import 'package:foxhole/util/g_nav.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() {
    return _SavingsScreenState();
  }
}

class _SavingsScreenState extends State<SavingsScreen> {
  @override
  Widget build(context) {
    return Scaffold(
      bottomNavigationBar: const CustomGNav(),
    );
  }
}
