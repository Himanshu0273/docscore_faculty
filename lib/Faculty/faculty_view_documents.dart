import 'package:docscore_faculty/Faculty/faculty_home.dart';
import 'package:docscore_faculty/Faculty/faculty_view_students.dart';
import 'package:docscore_faculty/resources/constants.dart';
import 'package:docscore_faculty/resources/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:docscore_faculty/models/users.dart' as user_model;
import 'package:docscore_faculty/Faculty/utils/utils.dart';

class ViewDocuments extends StatefulWidget {
  const ViewDocuments({
    super.key,
    required this.documents,
    required this.studentRegno,
  });

  final List<String> documents;
  final String studentRegno;

  @override
  State<ViewDocuments> createState() =>
      _ViewDocumentsState(documents: documents, studentRegno: studentRegno);
}

class _ViewDocumentsState extends State<ViewDocuments> {
  final List<String> documents;
  final String studentRegno;

  late Future<Map<String, dynamic>> _uploadedDocsData;

  _ViewDocumentsState({
    required this.studentRegno,
    required this.documents,
  });

  @override
  void initState() {
    super.initState();
    _uploadedDocsData = user_model.User().getDocsData(studentRegno, documents);
    print(documents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _uploadedDocsData,
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
              Map<String, dynamic> data = snapshot.data;
              print(data);

              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: backgroundGradient(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 12,
                            right: 12,
                            bottom: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
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
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 50,
                                    width: 120,
                                    child: Image.asset(
                                      'assets/SRM_1.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 5, bottom: 5),
                          child: FittedBox(
                            child: Text(
                              "Registration Number: $studentRegno",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 5, bottom: 5),
                          child: FittedBox(
                            child: Text(
                              "Name: ${data['name']}",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 5, bottom: 5),
                          child: FittedBox(
                            child: Text(
                              "Section: ${data['section']}",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Uploaded Documents:",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: documents.length,
                            itemBuilder: (context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    child: ListTile(
                                      title: Text(
                                        documents[index],
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      trailing: TextButton(
                                        onPressed: () {
                                          launchInBrowser(Uri.parse(
                                              data[documents[index]]["url"]));
                                        },
                                        child: const Text(
                                          "View",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Text("Submit"),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
