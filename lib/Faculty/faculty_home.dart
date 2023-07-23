import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/constants/colors.dart';

class faculty_homepage extends StatelessWidget {
  const faculty_homepage({super.key});

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
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Color(0xffD9D9D9),
                            size: 30,
                          ),
                        ),
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
                  // Profile Photo
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        child: Image.asset(
                          'assets/download.jpg',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Container(
                        width: 2, // Adjust the width of the line as needed
                        height: 150, // Adjust the height of the line as needed
                        color: const Color(0xffD9D9D9),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              "Name : ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Faculty ID: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Year : ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 0.5,
                    thickness: 1,
                    color: Color(0xffD9D9D9),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //Section Heading Box
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffD9D9D9),
                    ),
                    child: const Center(
                      child: Text(
                        "Sections",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),

                  //Section Selection Buttons
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        //Headings
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Text(
                                "Section",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Text(
                                "Course",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Text(
                                "Students ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        //Section 1
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/faculty_section1');
                            },
                            child: const Row(
                              children: [
                                Text('AB-2'),
                                Spacer(),
                                Text('B.Tech CSE with GT'),
                                Spacer(),
                                Text('52'),
                                SizedBox(
                                  width: 2.5,
                                ),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //Section 2
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/faculty_section1');
                            },
                            child: const Row(
                              children: [
                                Text('AB-2'),
                                Spacer(),
                                Text('B.Tech CSE with GT'),
                                Spacer(),
                                Text('52'),
                                SizedBox(
                                  width: 2.5,
                                ),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //Section 3
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/faculty_section1');
                            },
                            child: const Row(
                              children: [
                                Text('AB-2'),
                                Spacer(),
                                Text('B.Tech CSE with GT'),
                                Spacer(),
                                Text('52'),
                                SizedBox(
                                  width: 2.5,
                                ),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                          ),
                        ),
                      ],
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
