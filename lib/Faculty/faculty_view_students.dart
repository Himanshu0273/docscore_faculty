import 'package:docscore_faculty/models/sections.dart';
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
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            gradient: backgroundGradient(),
                          ),
                          child: Column(
                            children: [
                              FacultyAppBar(
                                sectionName: section,
                              ),
                              const Heading(heading: "Students"),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                              const SizedBox(
                                height: 12,
                              ),
                              SingleChildScrollView(
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
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
                      ],
                    ),
                  );
                }
              }
            }),
      ),
    );
  }
}
