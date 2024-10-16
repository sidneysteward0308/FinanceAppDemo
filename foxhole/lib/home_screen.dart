import 'package:flutter/material.dart';
import 'package:foxhole/models/category_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      body: Align(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 15, left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/images/avatar.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "User's Name",
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 190,
                      ),
                      const Icon(Icons.notifications_outlined),
                    ],
                  ),
                ),
              ),

              //PIE CHART PADDING
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 355,
                  width: 400,
                ),
              ),

              //PAGE NAVIGATION PADDING
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 315,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Categories",
                            style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 25,
                          ),

                          //income
                          CategoryContainer(
                            categoryAmount: 447.84,
                            categoryPercent: 84,
                            categoryName: "Income",
                            categoryImagePath: "assets/images/income.png",
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          //Expenses
                          CategoryContainer(
                            categoryAmount: 447.84,
                            categoryPercent: 84,
                            categoryName: "Expenses",
                            categoryImagePath: "assets/images/expenses.png",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 25,
                          ),
                          //Payments
                          CategoryContainer(
                            categoryAmount: 447.84,
                            categoryPercent: 84,
                            categoryName: "Payments",
                            categoryImagePath: "assets/images/payments.png",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          //Investments
                          CategoryContainer(
                            categoryAmount: 447.84,
                            categoryPercent: 84,
                            categoryName: "Investments",
                            categoryImagePath: "assets/images/investments.png",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),  color: Colors.black,),
       
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              gap: 8,
              onTabChange: (index) {
                print(index);
              },
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
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
              ]),
        ),
      ),
    );
  }
}
