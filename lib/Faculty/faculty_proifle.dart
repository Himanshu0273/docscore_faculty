import 'package:docscore_faculty/Faculty/faculty_home.dart';
import 'package:docscore_faculty/Faculty/faculty_login.dart';
import 'package:docscore_faculty/resources/constants.dart';
import 'package:docscore_faculty/resources/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:docscore_faculty/models/users.dart' as user_model;

class Facultyprofile extends StatefulWidget {
  const Facultyprofile({super.key});

  @override
  State<Facultyprofile> createState() => _FacultyprofileState();
}

class _FacultyprofileState extends State<Facultyprofile> {
  late Future<Map<String, dynamic>> _facultyData;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _facultyData = user_model.User().getFacultyData();
  }

  @override
  TextStyle heading =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
          future: _facultyData,
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              Map<String, dynamic> data = snapshot.data!;

              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SafeArea(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width,
                            decoration:
                                BoxDecoration(gradient: backgroundGradient()),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            replaceScreen(
                                              context,
                                              faculty_homepage(),
                                            );
                                          },
                                          icon: const Icon(Icons.arrow_back,
                                              color: Colors.white, size: 25),
                                        ),
                                        const Text(
                                          "Profile",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      height: 70,
                                      width: 100,
                                      child: Image.asset(
                                        "assets/SRM_1.jpg",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.80,
                          width: MediaQuery.of(context).size.width,
                          decoration:
                              const BoxDecoration(color: Color(0xffD9D9D9)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.065,
                                ),
                                Text(
                                  data["name"],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Profile",
                                      style: heading,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 150.0),
                                      child: Column(
                                        children: [
                                          Text(
                                              "Section:${data["sections"].toString()}"),
                                          Icon(Icons.mail),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 170),
                                Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const SizedBox(width: 25),
                                        Text(
                                          "Contact Us",
                                          style: heading,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.email),
                                        Text(
                                          "   docscore@gmail.com",
                                          style: heading,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          _auth.signOut();
                                          nextScreen(context,
                                              const FacultyLoginScreen());
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  230, 215, 34, 31),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: const Center(
                                              child: Text(
                                            "Logout",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 45,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          }),
    ));
  }
}

class StudentProfileModels {
  static Widget profileText(Icon reqIcon, String reqText) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [reqIcon],
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(reqText)],
        )
      ],
    );
  }
}
