import 'package:flutter/material.dart';
import 'package:foxhole/models/settings_container.dart';
import 'package:foxhole/pages/login_logout/login_screen.dart';
import 'package:foxhole/util/g_nav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});



  Future<void> _logout(BuildContext context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);


    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false, 
    );
  }


  @override
  Widget build(context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                  image: const DecorationImage(
                    image: AssetImage("assets/images/avatar.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "User Name",
              style: GoogleFonts.lato(),
            ),
            const SizedBox(
              height: 50,
            ),
            SettingsContainer(
              onPressed: () {},
              icon: Icons.person,
              actionText: "View Profile",
              optionColor: const Color.fromARGB(255, 22, 95, 155),
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsContainer(
              onPressed: () {},
              icon: Icons.mail,
              actionText: "Notifications",
              optionColor: const Color.fromARGB(255, 22, 95, 155),
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsContainer(
              onPressed: () {},
              icon: Icons.help,
              actionText: "Help and FAQs",
              optionColor: const Color.fromARGB(255, 22, 95, 155),
            ),
            const SizedBox(
              height: 200,
            ),
            SettingsContainer(
              onPressed: () async {
        
                await _logout(context);
              },
              icon: Icons.exit_to_app,
              actionText: "logout",
              optionColor: Colors.red,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomGNav(),
    );
  }
}
