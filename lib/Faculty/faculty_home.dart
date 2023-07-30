import 'package:docscore_faculty/Faculty/faculty_proifle.dart';
import 'package:docscore_faculty/resources/constants.dart';
import 'package:docscore_faculty/widgets/faculty_home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/constants/colors.dart';

class faculty_homepage extends StatelessWidget {
  faculty_homepage({super.key});

  //Faculty Homepage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Text(
                          'Home',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
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
                  ),

                  const Heading(heading: "Sections"),
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
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const HomeTile(
                            sectionName: "AB2",
                            numberOfStudents: "53",
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
      ),
    );
  }
}
