import 'package:flutter/material.dart';
import 'package:foxhole/database/Sqflite_database.dart';
import 'package:foxhole/util/dialog_box.dart';
import 'package:foxhole/util/g_nav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class LinkInstitution extends StatefulWidget {
  final List<String> institutions;

  const LinkInstitution({super.key, required this.institutions});

  @override
  State<LinkInstitution> createState() {
    return _LinkInstitutionState();
  }
}

class _LinkInstitutionState extends State<LinkInstitution> {
  final TextEditingController _institutionName = TextEditingController();
  final TextEditingController _institutionRoutingNumber = TextEditingController();
  final TextEditingController _institutionAccountNumber = TextEditingController();


 void addInstitution() async {
  if (_institutionName.text.isNotEmpty &&
      _institutionRoutingNumber.text.isNotEmpty &&
      _institutionAccountNumber.text.isNotEmpty) {

    await SqfliteDatabase.instance.addInstitution(
      _institutionName.text,
      _institutionAccountNumber.text,
      _institutionRoutingNumber.text,
      "linked", 
    );


  setState(() {
      widget.institutions.add(_institutionName.text);
      _institutionName.clear();
      _institutionRoutingNumber.clear();
      _institutionAccountNumber.clear();
    });
  }
}

void showLinkInstitutionDialog() {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        controller: _institutionName,
        onSave: addInstitution,
        onCancel: () => Navigator.of(context).pop(),
        specifyTask: "Enter Institution Name",
        currentDate: DateFormat('MM-dd-yyyy').format(DateTime.now()),
        userBalance: 0.0,
        institutions: widget.institutions,
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Link Institution',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 48, 71),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _institutionName ,
              decoration: const InputDecoration(
                labelText: 'Enter Institution Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _institutionRoutingNumber ,
              decoration: const InputDecoration(
                labelText: 'Routing Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),


            TextField(
              controller: _institutionAccountNumber ,
              decoration: const InputDecoration(
                labelText: 'Account Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addInstitution,
              
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 2, 48, 71),
              ),

              child: Text(
                'Add Institution',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.institutions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.institutions[index]),
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
