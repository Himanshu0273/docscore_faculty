import 'package:docscore_faculty/Faculty/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewStudents extends StatelessWidget {
  const ViewStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF1F2C45),
                      Color(0xFF274B93),
                      Color(0XFF2A519D),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xffD9D9D9),
                            size: 30,
                          ),
                        ),
                        Text(
                          'Students',
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 18),
                          // child: StudentTile(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
