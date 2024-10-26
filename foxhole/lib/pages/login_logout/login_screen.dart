import 'package:flutter/material.dart';
import 'package:foxhole/pages/login_logout/createaccount_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foxhole/database/Sqflite_database.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for user input
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  String userEmail = "";
  String userPassword = "";


  bool isChecked = false;

  // Style variables
  double spacingHeight = 10;
  Color mainAccentColor = const Color.fromARGB(255, 40, 88, 133);
  late Color checkBoxColor;

  // Method to get checkbox color based on state
  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    checkBoxColor = isChecked ? mainAccentColor : Colors.white;
    return states.any(interactiveStates.contains) ? Colors.blue : checkBoxColor;
  }

  
  Future<void> _login() async {
    userEmail = userEmailController.text.trim();
    userPassword = userPasswordController.text.trim();

    if (userEmail.isNotEmpty && userPassword.isNotEmpty) {
      var user = await SqfliteDatabase.instance.getUser(userEmail, userPassword);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful!')));
        Navigator.pushNamed(context, '/home'); 
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid email or password.')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter your credentials.')));
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 220),
                child: Text(
                  "Login",
                  style: GoogleFonts.playfairDisplay(color: Colors.black, fontSize: 48),
                ),
              ),
              SizedBox(height: spacingHeight),
              TextField(
                controller: userEmailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: 'Email',
                  hintStyle: GoogleFonts.playfairDisplay(color: Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(height: spacingHeight),
              TextField(
                controller: userPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: 'Password',
                  hintStyle: GoogleFonts.playfairDisplay(color: Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(height: spacingHeight),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text("Remember Me"),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainAccentColor,
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.playfairDisplay(
                        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Or Login With',
                      style: TextStyle(color: Color.fromARGB(255, 137, 136, 136)),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/google_logo.png',
                      height: 24.0,
                    ),
                    const SizedBox(width: 10.0),
                    const Text("Login with Google", style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/apple_logo.png',
                      height: 24.0,
                    ),
                    const SizedBox(width: 10.0),
                    const Text("Login with Apple", style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                child: Column(
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CreateaccountScreen(),
                transitionDuration: Duration.zero, // No transition
                reverseTransitionDuration:
                    Duration.zero, // No reverse transition
              ),
            );},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                      ),
                      child: const Text("Create Account"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
