import 'package:docscore_faculty/Faculty/faculty_home.dart';
import 'package:docscore_faculty/models/sections.dart';
import 'package:docscore_faculty/resources/constants.dart';
import 'package:docscore_faculty/resources/constants/colors.dart';
import 'package:docscore_faculty/widgets/faculty_appbar.dart';
import 'package:docscore_faculty/widgets/faculty_home_widgets.dart';
import 'package:docscore_faculty/widgets/faculty_view_students.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:docscore_faculty/models/users.dart' as user_model;

class ViewStudents extends StatefulWidget {
  final String section;

  const ViewStudents({
    super.key,
    required this.section,
  });

  @override
  State<ViewStudents> createState() => _ViewStudentsState(section: section);
}

class _ViewStudentsState extends State<ViewStudents> {
  final String section;
  _ViewStudentsState({
    // super.key;
    required this.section,
  });

  late Future<Map<String, dynamic>> _sectionData;

  @override
  void initState() {
    super.initState();
    _sectionData = user_model.User()
        .getSectionData(section, FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _sectionData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                Map<String, dynamic> data = snapshot.data!;
                List<String> regno = data.keys.toList();

                return SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: backgroundGradient(),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  nextScreen(
                                    context,
                                    faculty_homepage(),
                                  );
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFFE9EFFF),
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 15),
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
                        ),
                        Text(
                          "Section: ${section}",
                          style: GoogleFonts.montserrat(
                              color: const Color(0xFFE9EFFF),
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  30 * MediaQuery.of(context).textScaleFactor),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Text(
                                  "Name",
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xFFE9EFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20 *
                                          MediaQuery.of(context)
                                              .textScaleFactor),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 10,
                              // ),
                              FittedBox(
                                child: Text(
                                  "Regn. No.",
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xFFE9EFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20 *
                                          MediaQuery.of(context)
                                              .textScaleFactor),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 10,
                              // ),
                              FittedBox(
                                child: Text(
                                  "Docs Uploaded",
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xFFE9EFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15 *
                                          MediaQuery.of(context)
                                              .textScaleFactor),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: ListView.builder(
                              itemCount: regno.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return StudentTile(
                                  name: data[regno[index]]["name"],
                                  docsUploaded: data[regno[index]]
                                      ["docsUploaded"],
                                  docs: data[regno[index]]["documents"],
                                  regno: regno[index],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
