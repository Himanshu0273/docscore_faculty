import 'package:docscore_faculty/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Faculty/faculty_proifle.dart';

class FacultyAppBar extends StatelessWidget {
  const FacultyAppBar({super.key, required this.sectionName});

  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Text(
            sectionName,
            style: GoogleFonts.montserrat(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 40,
            width: 105,
            child: Image.asset(
              'assets/SRM_1.jpg',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
