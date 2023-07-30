import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({required this.sectionName, required this.numberOfStudents});

  final String sectionName;
  final String numberOfStudents;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            sectionName,
            style: GoogleFonts.montserrat(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            numberOfStudents,
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.w400),
          ),
          Text(
            "Students",
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heading,
            style: GoogleFonts.montserrat(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: Colors.white,
              decorationThickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
