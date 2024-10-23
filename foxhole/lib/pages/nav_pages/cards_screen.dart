import 'package:flutter/material.dart';
import 'package:foxhole/util/g_nav.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

 @override
  Widget build(context) {
    return const Scaffold(
      
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Text("Cards Screen")],
        ),
      ),

      backgroundColor: Colors.white,
        bottomNavigationBar: CustomGNav(),
    );
  }
}
