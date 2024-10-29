import 'package:flutter/material.dart';
import 'package:foxhole/util/my_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String specifyTask;
  final String currentDate;
  final double userBalance;
  final List<String> institutions;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.specifyTask,
    required this.currentDate,
    required this.userBalance,
    required this.institutions,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  String selectedInstitution = "Select Institution"; // Default placeholder text

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 360,
        width: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.currentDate,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: 400,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedInstitution == "Select Institution" ? null : selectedInstitution,
                hint: Text(selectedInstitution), 
                dropdownColor: const Color.fromARGB(255, 230, 230, 230),
                style: const TextStyle(color: Colors.black),
                items: widget.institutions.map((String institution) {
                  return DropdownMenuItem<String>(
                    value: institution,
                    child: Text(institution),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedInstitution = value ?? "Select Institution";
                  });
                },
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: widget.specifyTask,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  buttonName: "Save",
                  onPressed: widget.onSave,
                ),
                const SizedBox(width: 5),
                MyButton(
                  buttonName: "Cancel",
                  onPressed: widget.onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
