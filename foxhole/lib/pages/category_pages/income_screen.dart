import 'package:flutter/material.dart';
import 'package:foxhole/database/Sqflite_database.dart';
import 'package:foxhole/util/g_nav.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() {
    return _IncomeScreenState();
  }
}

class _IncomeScreenState extends State<IncomeScreen> {
  List<Map<String, dynamic>> _deposits = [];

  @override
  void initState() {
    super.initState();
    _loadDeposits();
  }


  Future<void> _loadDeposits() async {
    List<Map<String, dynamic>> transactions = await SqfliteDatabase.instance.getTransactions();
    setState(() {
      _deposits = transactions.where((t) => t['type'] == 'deposit').toList();
    });
  }


  Future<void> _addDeposit(double amount) async {
    await SqfliteDatabase.instance.createTransaction(amount, 'deposit', DateTime.now().toString());
    _loadDeposits(); 
  }


  Future<double?> _showDepositDialog() async {
    double? amount;
    return showDialog<double>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Deposit Amount'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              amount = double.tryParse(value);
            },
            decoration: const InputDecoration(hintText: 'Amount'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(amount);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Income')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _deposits.length,
              itemBuilder: (context, index) {
                final deposit = _deposits[index];
                return ListTile(
                  title: Text("Amount: \$${deposit['amount']}"),
                  subtitle: Text("Date: ${deposit['date']}"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                final amount = await _showDepositDialog();
                if (amount != null) {
                  _addDeposit(amount);
                }
              },
              child: const Text("Add Deposit"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomGNav(),
    );
  }


  
}
