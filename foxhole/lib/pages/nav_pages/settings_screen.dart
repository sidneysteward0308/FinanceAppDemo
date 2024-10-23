import 'package:flutter/material.dart';
import 'package:foxhole/util/g_nav.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(context) {
    return const Scaffold(
      
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Text("Settings Screen")],
        ),
      ),

      backgroundColor: Colors.white,
        bottomNavigationBar: CustomGNav(),
    );
  }
}
