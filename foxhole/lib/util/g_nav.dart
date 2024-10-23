import 'package:flutter/material.dart';
import 'package:foxhole/home_screen.dart';
import 'package:foxhole/pages/nav_pages/cards_screen.dart';
import 'package:foxhole/pages/nav_pages/settings_screen.dart';
import 'package:foxhole/pages/nav_pages/wallet_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class CustomGNav extends StatelessWidget {
  const CustomGNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
      child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
            gap: 8,
            onTabChange: (index) {
              // Set a default value for targetScreen
              Widget targetScreen = const HomeScreen();
        
              if (index == 0) {
                
                targetScreen = const HomeScreen();
              } else if (index == 1) {
                targetScreen = const WalletScreen();
              } else if (index == 2) {
                targetScreen = const CardsScreen();
              } else if (index == 3) {
                targetScreen = const SettingsScreen();
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
                icon: Icons.credit_card,
                text: "Cards",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ]),
      ),
    );
  }
}
