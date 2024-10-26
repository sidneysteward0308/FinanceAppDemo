import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkInstitution extends StatefulWidget {
  final List<String> institutions;

  const LinkInstitution({super.key, required this.institutions});

  @override
  State<LinkInstitution> createState() {
    return _LinkInstitutionState();
  }
}

class _LinkInstitutionState extends State<LinkInstitution> {
  final TextEditingController _institutionController = TextEditingController();


  void addInstitution() {
    if (_institutionController.text.isNotEmpty) {
      setState(() {
        widget.institutions.add(_institutionController.text);
        _institutionController.clear();
      });
    }
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
              controller: _institutionController,
              decoration: const InputDecoration(
                labelText: 'Enter Institution Name',
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
    );
  }
}
