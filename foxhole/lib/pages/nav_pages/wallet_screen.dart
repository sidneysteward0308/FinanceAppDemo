import 'package:flutter/material.dart';
import 'package:foxhole/database/Sqflite_database.dart';


import 'package:foxhole/util/dialog_box.dart';
import 'package:foxhole/util/g_nav.dart';

import 'package:intl/intl.dart';

class WalletScreen extends StatefulWidget {
  final Function(double) onIncomeUpdated;
  final Function(double) onExpensesUpdated;
  final double currentIncome;
  final double currentExpenses;

  const WalletScreen({
    Key? key,
    required this.onIncomeUpdated,
    required this.onExpensesUpdated,
    required this.currentIncome,
    required this.currentExpenses,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TextEditingController depositController = TextEditingController();
  final TextEditingController withdrawController = TextEditingController();

  var now = DateTime.now();
  var formatter = DateFormat('MM-dd-yyyy');
  late String formattedDate;
  double? userBalance = 0;
  List<Map<String, dynamic>> transactions = [];

  @override
  void initState() {
    super.initState();
    formattedDate = formatter.format(now);
    _loadTransactions();
  }

Future<void> _loadTransactions() async {
  List<Map<String, dynamic>> allTransactions = await SqfliteDatabase.instance.getTransactions();
  setState(() {
    transactions = List.from(allTransactions); // Create a modifiable copy
    userBalance = transactions.fold<double>(0.0, (double sum, transaction) {
      double amount = (transaction['amount'] ?? 0.0).toDouble(); // Ensures a double value
      return transaction['type'] == 'deposit'
          ? (sum) + amount
          : (sum) - amount;
    });
  });
}



  void createDeposit() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: depositController,
          onSave: makeDeposit,
          onCancel: () => Navigator.of(context).pop(),
          specifyTask: "Enter Deposit Amount",
          currentDate: formattedDate,
        );
      },
    );
  }

  void makeDeposit() async {
    double depositAmount = double.tryParse(depositController.text) ?? 0.0;
    await SqfliteDatabase.instance.createTransaction(depositAmount, 'deposit', DateTime.now().toString());
    
    setState(() {
      widget.onIncomeUpdated(widget.currentIncome + depositAmount);
      userBalance = (userBalance ?? 0) + depositAmount;
      depositController.clear();
      transactions.add({
        "type": "Deposit",
        "amount": depositAmount,
        "date": formattedDate,
      });
    });
    Navigator.of(context).pop();
  }

  void createWithdraw() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: withdrawController,
          onSave: makeWithdraw,
          onCancel: () => Navigator.of(context).pop(),
          specifyTask: "Enter Withdraw Amount",
          currentDate: formattedDate,
        );
      },
    );
  }

 void makeWithdraw() async {
  double withdrawAmount = double.tryParse(withdrawController.text) ?? 0.0;
  await SqfliteDatabase.instance.createTransaction(withdrawAmount, 'withdrawal', DateTime.now().toString());

  setState(() {
    widget.onExpensesUpdated(widget.currentExpenses + withdrawAmount);
    userBalance = (userBalance ?? 0) - withdrawAmount;
    withdrawController.clear();

    transactions = List.from(transactions)..add({
      "type": "Withdraw",
      "amount": withdrawAmount,
      "date": formattedDate,
    });
  });
  Navigator.of(context).pop(); 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        child: Container(
          padding: const EdgeInsets.only(top: 70, bottom: 15, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Wallet Header
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 140, right: 100),
                        child: Text(
                          "Wallet",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 4),

              // Current Balance Section
              Container(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 20, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Current Balance"),
                    Text(
                      "\$$userBalance",
                      style: const TextStyle(fontSize: 40, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: createDeposit,
                          icon: const Icon(Icons.arrow_downward, color: Colors.black),
                          label: const Text('Deposit', style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 244, 243, 243),
                            minimumSize: const Size(170, 50),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: createWithdraw,
                          icon: const Icon(Icons.arrow_outward, color: Colors.white),
                          label: const Text('Withdraw', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 2, 48, 71),
                            minimumSize: const Size(170, 50),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 22),

              // Recent Transactions Section
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Recent Transactions",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return ListTile(
                        title: Text(transaction["type"]),
                        subtitle: Text(transaction["date"]),
                        trailing: Text("\$${transaction["amount"]}"),
                      );
                    },
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
