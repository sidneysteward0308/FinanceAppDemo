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
  
    return const Scaffold(
      bottomNavigationBar:  CustomGNav(),
    );
  }
}
