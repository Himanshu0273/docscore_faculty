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
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Students:",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (BuildContext context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 18),
                          // child: StudentTile(),
                        );
                      },

                      //   SingleChildScrollView(
                      //     child: SizedBox(
                      //       height: MediaQuery.of(context).size.height * 0.7,
                      //       child: ListView.builder(
                      //         itemCount: 19,
                      //         shrinkWrap: true,
                      //         physics: const BouncingScrollPhysics(),
                      //         itemBuilder: (context, index) {
                      //           return StudentTile(
                      //             name: "Debargha",
                      //             docsUploaded: 2,
                      //           );
                      //         },
                      //       ),

                      //     ),
                      //   )
                      // ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
