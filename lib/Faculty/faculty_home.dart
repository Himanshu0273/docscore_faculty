import 'package:docscore_faculty/Faculty/faculty_proifle.dart';
import 'package:docscore_faculty/resources/constants.dart';
import 'package:docscore_faculty/widgets/faculty_home_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/constants/colors.dart';
import 'package:docscore_faculty/models/users.dart' as user_model;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class faculty_homepage extends StatefulWidget {
  faculty_homepage({super.key});

  @override
  State<faculty_homepage> createState() => _faculty_homepageState();
}

class _faculty_homepageState extends State<faculty_homepage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  late Future<Map<String, dynamic>> _facultyHomePageData;

  @override
  void initState() {
    super.initState();
    // _sections = user_model.User().getFacultySectionList(_auth.currentUser!.uid);
    _facultyHomePageData =
        user_model.User().getFacultySectionData(_auth.currentUser!.uid);
  }

  //Faculty Homepage
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Map<String, dynamic>>(
          future: _facultyHomePageData,
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
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
                List<String> sections = data.keys.toList();
                print(sections);

                return SingleChildScrollView(
                  child: LiquidPullToRefresh(
                    color: const Color(0xFF0D47A1),
                    backgroundColor: Colors.white,
                    springAnimationDurationInMilliseconds: 1000,
                    onRefresh: () async {
                      // to test out refresh
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => faculty_homepage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(gradient: backgroundGradient()),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            //logo
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    maxRadius: 23,
                                    child: IconButton(
                                      onPressed: () {
                                        nextScreen(
                                          context,
                                          const Facultyprofile(),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                        size: 30,
                                      ),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    "SECTIONS",
                                    style: TextStyle(
                                        fontSize: 30 *
                                            MediaQuery.of(context)
                                                .textScaleFactor,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount: sections.length,
                                  itemBuilder: (context, index) {
                                    return HomeTile(
                                      sectionName: sections[index],
                                      numberOfStudents: data[sections[index]]
                                              ["strength"]
                                          .toString(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
