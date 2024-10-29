import 'package:flutter/material.dart';
import 'package:foxhole/home_screen.dart';
import 'package:foxhole/pages/functionality/link_institution.dart';
import 'package:foxhole/pages/nav_pages/settings_screen.dart';
import 'package:foxhole/pages/nav_pages/wallet_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomGNav extends StatefulWidget {
  const CustomGNav({Key? key}) : super(key: key);

  @override
  _CustomGNavState createState() => _CustomGNavState();
}

class _CustomGNavState extends State<CustomGNav> {
  double income = 0;
  double expenses = 0;

  final List<String> institutions = [];

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
            Widget targetScreen = const HomeScreen();

            if (index == 0) {
              targetScreen = const HomeScreen();
            } else if (index == 1) {
              targetScreen = WalletScreen(
                onIncomeUpdated: (newIncome) {
                  setState(() {
                    income = newIncome;
                    
                  });
                },
                onExpensesUpdated: (newExpenses) {
                  setState(() {
                    expenses = newExpenses;
                  });
                },
                currentIncome: income,
                currentExpenses: expenses,
              );
            } else if (index == 2) {
              targetScreen = LinkInstitution(institutions: institutions);
            } else if (index == 3) {
              targetScreen = const SettingsScreen();
            }

            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    targetScreen,
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
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
              icon: Icons.business,
              text: "Institutions",
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}