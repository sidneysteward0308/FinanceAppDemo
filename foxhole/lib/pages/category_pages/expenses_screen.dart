import 'package:flutter/material.dart';
import 'package:foxhole/database/Sqflite_database.dart';
import 'package:foxhole/util/g_nav.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  List<Map<String, dynamic>> _withdrawals = [];

  @override
  void initState() {
    super.initState();
    _loadWithdrawals();
  }


  Future<void> _loadWithdrawals() async {
    List<Map<String, dynamic>> transactions = await SqfliteDatabase.instance.getTransactions();
    setState(() {
      _withdrawals = transactions.where((t) => t['type'] == 'withdrawal').toList();
    });
  }


  Future<void> _addWithdrawal(double amount) async {
    await SqfliteDatabase.instance.createTransaction(amount, 'withdrawal', DateTime.now().toString());
    _loadWithdrawals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _withdrawals.length,
              itemBuilder: (context, index) {
                final withdrawal = _withdrawals[index];
                return ListTile(
                  title: Text("Amount: \$${withdrawal['amount']}"),
                  subtitle: Text("Date: ${withdrawal['date']}"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                final amount = await _showWithdrawalDialog();
                if (amount != null) {
                  _addWithdrawal(amount);
                }
              },
              child: const Text("Add Withdrawal"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomGNav(),
    );
  }


  Future<double?> _showWithdrawalDialog() async {
    double? amount;
    return showDialog<double>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Withdrawal Amount'),
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
}
