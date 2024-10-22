import 'package:flutter/material.dart';
import 'package:foxhole/home_screen.dart';
import 'package:foxhole/pages/nav_pages/wallet_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class CustomGNav extends StatelessWidget {
  const CustomGNav({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
        gap: 8,
        onTabChange: (index) {
          // Set a default value for targetScreen
          Widget targetScreen = const HomeScreen();

          if (index == 0) {
            
            targetScreen = const HomeScreen();
          } else if (index == 1) {
            targetScreen = const WalletScreen();
          } else if (index == 2) {
            targetScreen = const HomeScreen();
          } else if (index == 3) {
            targetScreen = const HomeScreen();
          }

          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => targetScreen,
              transitionDuration: Duration.zero, // No transition
              reverseTransitionDuration: Duration.zero, // No reverse transition
            ),
          );
        },
       
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: (Colors.white),
        tabBackgroundColor: Colors.grey.shade800,
        padding: const EdgeInsets.all(16),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.wallet,
            text: "Wallet",
          ),
          GButton(
            icon: Icons.search,
            text: "Search",
          ),
          GButton(
            icon: Icons.settings,
            text: "Settings",
          ),
        ]);
  }
}
