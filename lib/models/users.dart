import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore_faculty/models/student.dart' as student_model;
import 'package:docscore_faculty/models/faculty.dart' as faculty_model;
import 'package:firebase_core/firebase_core.dart';

class User {
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
  static Future addFaculty(
      String eMail, String facultyName, List<String> sections) async {
    faculty_model.Faculty faculty = faculty_model.Faculty(
      name: facultyName,
      sections: sections,
    );
    String uid = "";
    for(int i = 0; i< eMail.length;i++){
      if(eMail[i]=="@") break;
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
}
