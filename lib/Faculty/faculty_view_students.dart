import 'package:docscore_faculty/resources/constants/colors.dart';
import 'package:docscore_faculty/widgets/faculty_appbar.dart';
import 'package:docscore_faculty/widgets/faculty_home_widgets.dart';
import 'package:docscore_faculty/widgets/faculty_view_students.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewStudents extends StatelessWidget {
  const ViewStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(gradient: backgroundGradient()),
              child: Column(
                children: [
                  FacultyAppBar(
                    sectionName: "AB2",
                  ),
                  Heading(heading: "Students"),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        "Docs Uploaded",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(
                        itemCount: 19,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return StudentTile(
                            name: "Debargha",
                            docsUploaded: 2,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
