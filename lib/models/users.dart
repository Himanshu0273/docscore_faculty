import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore_faculty/Faculty/docsuploaded.dart';
import 'package:docscore_faculty/models/student.dart' as student_model;
import 'package:docscore_faculty/models/faculty.dart' as faculty_model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class User {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  // FUNCTIONS TO UPDATE OR ADD INTO DATABASE

  // add student in user collection with nill documents uploaded
  static Future addStudent(String regno, String studentName) async {
    String res = "Error";
    try {
      student_model.Student student =
          student_model.Student(name: studentName, documents: {
        "10th_Marksheet": "",
        "12th_Marksheet": "",
        "JEE_Admit_Card": "",
        "JEE_Rank_Card": "",
      });

      await FirebaseFirestore.instance.collection("users").doc(regno).set(
            student.toJson(),
          );

      res = "success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  // add Faculty in user collection
  static Future addFacultyToUsers(
      String eMail, String facultyName, List<String> sections) async {
    faculty_model.Faculty faculty = faculty_model.Faculty(
      name: facultyName,
      sections: sections,
    );
    String uid = "";
    for (int i = 0; i < eMail.length; i++) {
      if (eMail[i] == "@") break;
      uid += eMail[i];
    }
    await FirebaseFirestore.instance.collection("users").doc(uid).set(
          faculty.toJson(),
        );
  }

  // Future addFacultyDetails(String eMail, List classes) async {

  //   await FirebaseFirestore.instance.collection("users").doc(uid)
  // }

  // FUNCTIONS TO GET FROM DATABASE
  static Future<bool> alreadyExists(String id) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(id).get();
    return documentSnapshot.exists;
  }

  static Future<String> getFacultyName(String uid) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return documentSnapshot["name"].toString();
  }

  Future<List<String>> getSectionStudentList(String section) async {
    List<String> studentList = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("users")
        .where("role", isEqualTo: "student")
        .where("section", isEqualTo: section)
        .get();

    querySnapshot.docs.forEach((doc) {
      studentList.add(doc.id);
    });

    return studentList;
  }

  Future<List<String>> getFacultySectionList(String uid) async {
    List<String> sectionList = [];
    DocumentSnapshot facultySectionSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    for (String section in facultySectionSnapshot["sections"]) {
      sectionList.add(section);
    }

    return sectionList;
  }

  Future<Map<String, dynamic>> getFacultySectionData(
    String uid,
  ) async {
    Map<String, dynamic> facultyHomePageData = {};
    DocumentSnapshot facultyUsersSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    for (String section in facultyUsersSnapshot["sections"]) {
      DocumentSnapshot sectionsSnapshot = await FirebaseFirestore.instance
          .collection("sections")
          .doc(section)
          .collection("Faculty advisors")
          .doc(uid)
          .get();
      var data = sectionsSnapshot.data();
      Map<String, dynamic> facData = data as Map<String, dynamic>;
      // print(facData);
      facultyHomePageData[section] = {
        "Students": facData["Students"],
        "strength": facData["Students"].length
      };
    }

    return facultyHomePageData;
  }

  Future<String> getStudentNameFromRegNo(String regno) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection("users").doc(regno).get();
    Map<String, dynamic>? data = querySnapshot.data();
    return data!["name"];
  }

  Future<Map?> getStudentDocumentList(String regNo) async {
    DocumentSnapshot docSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(regNo).get();
    if (docSnapshot.exists) {
      return docSnapshot["documents"];
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> getSectionData(
      String section, String uid) async {
    Map<String, dynamic> sectionData = {};

    DocumentSnapshot<Map<String, dynamic>> sectionStudentDataSnapshot =
        await FirebaseFirestore.instance
            .collection("sections")
            .doc(section)
            .collection("Faculty advisors")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();

    var data = sectionStudentDataSnapshot["Students"];

    List<String> studentRegnoList = [];
    for (String regno in data) {
      studentRegnoList.add(regno);
    }

    for (String regno in studentRegnoList) {
      DocumentSnapshot<Map<String, dynamic>> studentDataSnapshot =
          await FirebaseFirestore.instance.collection("users").doc(regno).get();

      var data = studentDataSnapshot.data()!;
      // print(data);

      Map<String, dynamic> studentData = data;
      // print(studentData);

      String name = studentData["name"];
      // print(name);
      // print(studentData["documents"].keys);
      List<String> documents = studentData["documents"].keys.toList();
      // print(documents);
      int docsUploaded = documents.length;

      sectionData[regno] = {
        "name": name,
        "documents": documents,
        "docsUploaded": docsUploaded,
      };
    }

    return sectionData;
  }

  Future<Map<String, dynamic>> getDocsData(
      String regno, List<String> docs) async {
    Map<String, dynamic> docsData = {};

    DocumentSnapshot<Map<String, dynamic>> docsSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(regno).get();

    for (String docName in docs) {
      var data = docsSnapshot["documents"][docName];

      docsData[docName] = {
        "verification": data[0],
        "url": data[1],
      };

      docsData["name"] = docsSnapshot["name"];
      docsData["section"] = docsSnapshot["section"];
    }

    // print(docsData);

    return docsData;
  }

  Future<Map<String, dynamic>> getFacultyData() async {
    Map<String, dynamic> data = {};

    DocumentSnapshot<Map<String, dynamic>> facultyDataSnapshot =
        await _firestore.collection("users").doc(_auth.currentUser!.uid).get();

    data["name"] = facultyDataSnapshot["name"];
    data["sections"] = facultyDataSnapshot["sections"];

    // print(data);

    return data;
  }
}
