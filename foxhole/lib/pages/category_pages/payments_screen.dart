import 'package:flutter/material.dart';
import 'package:foxhole/util/g_nav.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() {
    return _PaymentsScreenState();
  }
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(context) {
    return Scaffold(
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
