import 'package:docscore_faculty/Faculty/faculty_view_documents.dart';
import 'package:docscore_faculty/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({
    super.key,
    required this.name,
    required this.docsUploaded,
    required this.docs,
    required this.regno,
  });

  final String name;
  final int docsUploaded;
  final List<String> docs;
  final String regno;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              regno,
              style: GoogleFonts.montserrat(
                  fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              docsUploaded.toString(),
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios_sharp),
              onPressed: () {
                nextScreen(
                  context,
                  ViewDocuments(
                    documents: docs,
                    studentRegno: regno,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
