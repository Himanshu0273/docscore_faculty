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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FittedBox(
                    child: Text(
                      name,
                      style: GoogleFonts.montserrat(
                          fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FittedBox(
                    child: Text(
                      name,
                      style: GoogleFonts.montserrat(
                          fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FittedBox(
                    child: Text(
                      docsUploaded.toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              // IconButton(
              //   icon: const Icon(Icons.arrow_forward_ios_sharp),
              //   onPressed: () {
              //     nextScreen(
              //       context,
              //       ViewDocuments(
              //         documents: docs,
              //         studentRegno: regno,
              //       ),
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
