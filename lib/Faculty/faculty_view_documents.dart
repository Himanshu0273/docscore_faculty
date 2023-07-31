import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:docscore_faculty/models/users.dart' as user_model;

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
                child: Stack(
                  children: [
                    Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Color(0xffD9D9D9),
                                  size: 30,
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
                        const SizedBox(height: 15),
                        Text(
                          "   Name: Debargha Das",
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                        Text(
                          "   Registration Number: RA2111051010002",
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 70,
                            width: 220,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13)),
                            child: Center(
                                child: Text(
                              "Documents Uploaded",
                              style: GoogleFonts.montserrat(fontSize: 17),
                            )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
