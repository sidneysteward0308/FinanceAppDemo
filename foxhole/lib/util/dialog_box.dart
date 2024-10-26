import 'package:flutter/material.dart';
import 'package:foxhole/util/my_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;
  String specifyTask;
  String currentDate;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
      required this.specifyTask,
      required this.currentDate});

  @override
  Widget build(context) {
    String hintText = "Select Institution";
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 360,
        width: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get new task

            Text(
              currentDate,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 5,
            ),

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
                hint: Text(hintText),
                dropdownColor: const Color.fromARGB(255, 230, 230, 230),
                style: const TextStyle(color: Colors.black),
                items: <String>[
                  'First Institution',
                  'Second Institution',
                  'Third Institution',
                  'Fourth Institution'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                    onTap: () {
                        hintText = value;
                    },
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),

            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(), hintText: specifyTask),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  buttonName: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 5,
                ),
                MyButton(
                  buttonName: "Cancel",
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
