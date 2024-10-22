import 'package:flutter/material.dart';
import 'package:foxhole/util/g_nav.dart';

class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen ({super.key});

  @override
  State<InvestmentsScreen > createState() {
    return _InvestmentsScreenState();
  }
}

class _InvestmentsScreenState extends State<InvestmentsScreen > {
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
