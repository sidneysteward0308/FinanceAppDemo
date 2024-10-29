import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foxhole/home_screen.dart';
import 'package:foxhole/pages/login_logout/createaccount_screen.dart';
import 'package:foxhole/pages/login_logout/login_screen.dart';

void main() {
  runApp(const FoxholeApp());
}

class FoxholeApp extends StatelessWidget {
  const FoxholeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
              future: _checkUserLoggedIn(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data == true) {
                  return const HomeScreen(); 
                } else {
                  return const LoginScreen();
                }
              },
            ),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/createAccount': (context) => const CreateaccountScreen(),
      },
    );
  }

  Future<bool> _checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
