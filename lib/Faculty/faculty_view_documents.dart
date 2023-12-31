import 'package:docscore_faculty/Faculty/faculty_home.dart';
import 'package:docscore_faculty/Faculty/faculty_view_students.dart';
import 'package:docscore_faculty/resources/constants.dart';
import 'package:docscore_faculty/resources/constants/colors.dart';
import 'package:docscore_faculty/widgets/faculty_document_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:docscore_faculty/models/users.dart' as user_model;
import 'package:docscore_faculty/Faculty/utils/utils.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

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
    // print(documents);
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

              return SafeArea(
                child: SingleChildScrollView(
                  child: LiquidPullToRefresh(
                    color: const Color(0xFF0D47A1),
                    backgroundColor: Colors.white,
                    showChildOpacityTransition: false,
                    onRefresh: () async {
                      // to test out refresh
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewDocuments(
                            studentRegno: studentRegno,
                            documents: documents,
                          ),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
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
                                          ViewStudents(
                                            section: data['section'],
                                          ),
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
                                    DocumentTile(
                                      regno: data["regno"],
                                      documentName: documents[index],
                                      docData: data[documents[index]],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              },
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
    );
  }
}
