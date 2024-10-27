import 'package:flutter/material.dart';
import 'package:foxhole/database/Sqflite_database.dart';
import 'package:foxhole/util/g_nav.dart';
import 'package:foxhole/util/dialog_box.dart';
import 'package:intl/intl.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  final TextEditingController savingsController = TextEditingController();
  double totalSavings = 0.0;
  List<Map<String, dynamic>> savingsTransactions = [];
  var now = DateTime.now();
  var formatter = DateFormat('MM-dd-yyyy');
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = formatter.format(now);
    _loadSavings();
  }


  Future<void> _loadSavings() async {
    List<Map<String, dynamic>> allTransactions = await SqfliteDatabase.instance.getTransactions();
    setState(() {
      savingsTransactions = allTransactions.where((t) => t['type'] == 'savings').toList();
      totalSavings = savingsTransactions.fold(0.0, (sum, transaction) => sum + (transaction['amount'] ?? 0.0).toDouble());
    });
  }


  Future<void> _addSavings(double amount) async {
    await SqfliteDatabase.instance.createTransaction(amount, 'savings', DateTime.now().toString());
    _loadSavings(); 
  }

  void createSavings() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: savingsController,
          onSave: makeSavings,
          onCancel: () => Navigator.of(context).pop(),
          specifyTask: "Enter Savings Amount",
          currentDate: formattedDate,
        );
      },
    );
  }

  void makeSavings() async {
    double savingsAmount = double.tryParse(savingsController.text) ?? 0.0;
    await _addSavings(savingsAmount);

    setState(() {
      savingsController.clear();
      savingsTransactions.add({
        "type": "Savings",
        "amount": savingsAmount,
        "date": formattedDate,
      });
    });
    Navigator.of(context).pop(); 
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Savings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Savings: \$$totalSavings",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: createSavings,
              child: const Text("Add Savings"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: savingsTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = savingsTransactions[index];
                  return ListTile(
                    title: Text("Amount: \$${transaction['amount']}"),
                    subtitle: Text("Date: ${transaction['date']}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomGNav(),
    );
  }
}
