import 'package:flutter/material.dart';
import 'package:foxhole/home_screen.dart';
import 'package:foxhole/pages/login_logout/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foxhole/database/Sqflite_database.dart';

class CreateaccountScreen extends StatefulWidget {
  const CreateaccountScreen({super.key});

  @override
  State<CreateaccountScreen> createState() {
    return _CreateaccountScreenState();
  }
}

class _CreateaccountScreenState extends State<CreateaccountScreen> {
  // Controllers for user input
   TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

  String userEmail = "";
  String userPassword = "";
  String confirmedPassword = "";

  // Checkbox
  bool isChecked = false;

  // Style variables, should move this to a theme class
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
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }

    checkBoxColor = isChecked ? mainAccentColor : Colors.white;
    return checkBoxColor;
  }

//database methods
  Future<void> _createAccount() async {
    userEmail = userEmailController.text.trim();
    userPassword = userPasswordController.text.trim();
    confirmedPassword = confirmedPasswordController.text.trim();

    if (userPassword == confirmedPassword && userEmail.isNotEmpty) {
      int userId =
          await SqfliteDatabase.instance.createUser(userEmail, userPassword);
      if (userId > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully!')));
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Account creation failed. Try again.')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Passwords do not match or fields are empty.')));
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
                  "Let's get started",
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.black, fontSize: 48),
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
                  hintStyle: GoogleFonts.playfairDisplay(
                      color: Colors.black, fontSize: 16),
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
                  hintStyle: GoogleFonts.playfairDisplay(
                      color: Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(height: spacingHeight),
              TextField(
                controller: confirmedPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: 'Confirm Password',
                  hintStyle: GoogleFonts.playfairDisplay(
                      color: Colors.black, fontSize: 16),
                ),
              ),
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
                    onPressed: _createAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainAccentColor,
                    ),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
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
                      'Or Sign Up with',
                      style:
                          TextStyle(color: Color.fromARGB(255, 137, 136, 136)),
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
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
                    const Text("Sign up with Google",
                        style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
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
                    const Text("Sign up with Apple",
                        style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                       onPressed: () {Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    LoginScreen(),
                transitionDuration: Duration.zero, // No transition
                reverseTransitionDuration:
                    Duration.zero, // No reverse transition
              ),
            );},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                      ),
                      child: const Text("Login"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
