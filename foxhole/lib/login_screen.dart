import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
//variables to be used in later logic behind storing customer info
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  String userEmail = "";
  String userPassword = "";

  //check box
  bool isChecked = false;

//style variables, will later moved into a style class
  double spacingHeight = 10;

  Color mainAccentColor = const Color.fromARGB(255, 40, 88, 133);

  late Color checkBoxColor;

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }

    if (!isChecked) {
      checkBoxColor = Colors.white;
    } else {
      checkBoxColor = mainAccentColor;
    }

    return checkBoxColor;
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
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.black, fontSize: 48),
                ),
              ),
              SizedBox(
                height: spacingHeight,
              ),
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
              SizedBox(
                height: spacingHeight,
              ),
              TextField(
                controller: userPasswordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: 'Password',
                  hintStyle: GoogleFonts.playfairDisplay(
                      color: Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(
                height: spacingHeight,
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userEmail = userEmailController.text;
                        userPassword = userPasswordController.text;
                      });
                    },
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
              const SizedBox(
                height: 50,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Or Login With',
                      style:
                          TextStyle(color: Color.fromARGB(255, 137, 136, 136)),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, // Text color
                  backgroundColor: Colors.white, // Button background color
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0), // Add padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Button shape
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/google_logo.png', // Path to your Google logo
                      height: 24.0, // Adjust the height of the logo
                    ),

                    const SizedBox(
                        width: 10.0), // Add space between the logo and text

                    const Text(
                      "Login with Google",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, // Text color
                  backgroundColor: Colors.white, // Button background color
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0), // Add padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Button shape
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/apple_logo.png', // Path to your Google logo
                      height: 24.0, // Adjust the height of the logo
                    ),

                    const SizedBox(
                        width: 10.0), // Add space between the logo and text
                    const Text(
                      "Login with Apple",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                child: Column(
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // Remove default padding
                        minimumSize: const Size(
                            0, 0), // Optionally set minimum size to zero
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
