import 'package:flutter/material.dart';
import 'package:foxhole/database/Sqflite_database.dart';
import 'package:foxhole/models/category_container.dart';
import 'package:foxhole/pages/category_pages/expenses_screen.dart';
import 'package:foxhole/pages/category_pages/income_screen.dart';
import 'package:foxhole/pages/category_pages/investments_screen.dart';
import 'package:foxhole/pages/category_pages/savings_screen.dart';
import 'package:foxhole/util/g_nav.dart';
import 'package:foxhole/util/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  double income = 0;
  double expenses = 0;
  double savings = 0; // Dummy value for now. Koi use this to update the container on the HS
  double investments = 0; // Dummy value for now. Koi use this to update the container on the HS
  double other = 0; // Dummy value for now

  final TextEditingController depositController = TextEditingController();
  final TextEditingController withdrawController = TextEditingController();
  final TextEditingController savingsController = TextEditingController();
  final TextEditingController investmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    List<Map<String, dynamic>> transactions = await SqfliteDatabase.instance.getTransactions();
    setState(() {
      income = transactions.where((t) => t['type'] == 'deposit').fold(0, (sum, item) => sum + item['amount']);
      expenses = transactions.where((t) => t['type'] == 'withdrawal').fold(0, (sum, item) => sum + item['amount']);
      savings = transactions.where((t) => t['type'] == 'savings').fold(0, (sum, item) => sum + item['amount']);
      investments = transactions.where((t) => t['type'] == 'investment').fold(0, (sum, item) => sum + item['amount']);
    });
  }

  void makeDeposit() async {
    double depositAmount = double.tryParse(depositController.text) ?? 0.0;
    await SqfliteDatabase.instance.createTransaction(depositAmount, 'deposit', DateTime.now().toString());
    setState(() {
      income += depositAmount;
      depositController.clear();
    });
    Navigator.of(context).pop();
  }

  void makeWithdraw() async {
    double withdrawAmount = double.tryParse(withdrawController.text) ?? 0.0;
    await SqfliteDatabase.instance.createTransaction(withdrawAmount, 'withdrawal', DateTime.now().toString());
    setState(() {
      expenses += withdrawAmount;
      withdrawController.clear();
    });
    Navigator.of(context).pop(); 
  }

  void addSavings() async {
    double savingsAmount = double.tryParse(savingsController.text) ?? 0.0;
    await SqfliteDatabase.instance.createTransaction(savingsAmount, 'moved to savings', DateTime.now().toString());
    setState(() {
      savings += savingsAmount;
      savingsController.clear();
    });
    Navigator.of(context).pop(); 
  }

  void makeInvestment() async {
    double investmentAmount = double.tryParse(investmentController.text) ?? 0.0;
    await SqfliteDatabase.instance.createTransaction(investmentAmount, 'invest', DateTime.now().toString());
    setState(() {
      expenses += investmentAmount;
      investmentController.clear();
    });
    Navigator.of(context).pop(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      body: Align(
        child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 15, left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "User's Name",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 190),
                      const Icon(Icons.notifications_outlined),
                    ],
                  ),
                ),
              ),

              // PIE CHART PADDING
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 355,
                  width: 400,
                  child: CustomPieChartWidget(
                    income: income,
                    expenses: expenses,
                    savings: savings,
                    investments: investments,
                    other: other,
                  ),
                ),
              ),

              // PAGE NAVIGATION PADDING
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 280,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 30),
                          Text(
                            "Categories",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      const IncomeScreen(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ),
                              );
                            },
                            child:  CategoryContainer(
                              categoryAmount: income,
                              categoryPercent: 84,
                              categoryName: "Income",
                              categoryImagePath: "assets/images/income.png",
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      const ExpensesScreen(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ),
                              );
                            },
                            child: CategoryContainer(
                              categoryAmount: expenses,
                              categoryPercent: 84,
                              categoryName: "Expenses",
                              categoryImagePath: "assets/images/expenses.png",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      const SavingsScreen(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ),
                              );
                            },
                            child:  CategoryContainer(
                              categoryAmount: savings,
                              categoryPercent: 84,
                              categoryName: "Savings",
                              categoryImagePath: "assets/images/savings.png",
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      const InvestmentsScreen(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ),
                              );
                            },
                            child: CategoryContainer(
                              categoryAmount: investments,
                              categoryPercent: 84,
                              categoryName: "Investments",
                              categoryImagePath: "assets/images/investments.png",
                            ),
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
      bottomNavigationBar: const CustomGNav(),
    );
  }

  
}
