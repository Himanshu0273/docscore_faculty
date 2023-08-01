import 'package:docscore_faculty/Faculty/faculty_view_documents.dart';
import 'package:docscore_faculty/Faculty/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:docscore_faculty/models/users.dart' as user_model;

class DocumentTile extends StatefulWidget {
  const DocumentTile(
      {super.key,
      required this.documentName,
      required this.docData,
      required this.regno});

  final String documentName;
  final Map<String, dynamic> docData;
  final String regno;

  @override
  State<DocumentTile> createState() => _DocumentTileState(
      documentName: documentName, docData: docData, regno: regno);
}

class _DocumentTileState extends State<DocumentTile> {
  final String documentName;
  final Map<String, dynamic> docData;
  final String regno;

  _DocumentTileState({
    required this.documentName,
    required this.docData,
    required this.regno,
  });

  FirebaseAuth _auth = FirebaseAuth.instance;
  int? _verification;
  int? _newVerification;

  @override
  void initState() {
    super.initState();
    _verification = docData["verification"];
    print(_verification);
  }

  @override
  Widget build(BuildContext context) {
    if (_verification == 0) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FittedBox(
                    child: Text(
                      widget.documentName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _newVerification = 1;
                        },
                        icon: const Icon(Icons.check, color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () {
                          _newVerification = -1;
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      onPressed: () {
                        launchInBrowser(Uri.parse(docData["url"]));
                      },
                      child: const Text(
                        "View",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      onPressed: () {
                        user_model.User().updateStudentDocVerification(regno,
                            documentName, _newVerification!, docData["url"]);
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    } else if (_verification == 1) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FittedBox(
                    child: Text(
                      widget.documentName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  const Text(
                    "Verified Correct",
                    style: TextStyle(color: Color.fromARGB(255, 23, 237, 30)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      onPressed: () {
                        launchInBrowser(Uri.parse(docData["url"]));
                      },
                      child: const Text(
                        "View",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 70,
                  //   height: 35,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(15)),
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: const Text(
                  //       "Submit",
                  //       style: TextStyle(color: Colors.blue),
                  //     ),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FittedBox(
                    child: Text(
                      widget.documentName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  const Text(
                    "Verified Incorrect",
                    style: TextStyle(color: Color.fromARGB(255, 237, 23, 23)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      onPressed: () {
                        launchInBrowser(Uri.parse(docData["url"]));
                      },
                      child: const Text(
                        "View",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 70,
                  //   height: 35,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(15)),
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: const Text(
                  //       "Submit",
                  //       style: TextStyle(color: Colors.blue),
                  //     ),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
