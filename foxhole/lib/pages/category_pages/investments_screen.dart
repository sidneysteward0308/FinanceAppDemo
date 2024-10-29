import 'package:flutter/material.dart';
import 'package:foxhole/database/Sqflite_database.dart';
import 'package:foxhole/util/g_nav.dart';
import 'package:foxhole/util/dialog_box.dart';
import 'package:intl/intl.dart';

class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen({super.key});

  @override
  State<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends State<InvestmentsScreen> {
  final TextEditingController investmentController = TextEditingController();
  double totalInvestment = 0.0;
  List<Map<String, dynamic>> investments = [];
  var now = DateTime.now();
  var formatter = DateFormat('MM-dd-yyyy');
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = formatter.format(now);
    _loadInvestments();
  }


  Future<void> _loadInvestments() async {
    List<Map<String, dynamic>> allInvestments = await SqfliteDatabase.instance.getTransactions();
    setState(() {
      investments = allInvestments.where((t) => t['type'] == 'investment').toList();
      totalInvestment = investments.fold(0.0, (sum, investment) => sum + (investment['amount'] ?? 0.0).toDouble());
    });
  }


  Future<void> _addInvestment(double amount) async {
    await SqfliteDatabase.instance.createTransaction(amount, 'investment', DateTime.now().toString());
    _loadInvestments();
  }

  void createInvestment() {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        controller: investmentController,
        onSave: makeInvestment,
        onCancel: () => Navigator.of(context).pop(),
        specifyTask: "Enter Investment Amount",
        currentDate: formattedDate,
        userBalance: totalInvestment,
        institutions: [],
      );
    },
  );
}


  void makeInvestment() async {
    double investmentAmount = double.tryParse(investmentController.text) ?? 0.0;
    await _addInvestment(investmentAmount);

    setState(() {
      investmentController.clear();
      investments.add({
        "type": "Investment",
        "amount": investmentAmount,
        "date": formattedDate,
      });
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Investments')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Investment: \$$totalInvestment",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: createInvestment,
              child: const Text("Add Investment"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: investments.length,
                itemBuilder: (context, index) {
                  final investment = investments[index];
                  return ListTile(
                    title: Text("Amount: \$${investment['amount']}"),
                    subtitle: Text("Date: ${investment['date']}"),
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
