// ignore_for_file: unused_import, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:docscore_faculty/models/users.dart';
import 'package:docscore_faculty/models/faculty.dart' as faculty_model;
import 'package:docscore_faculty/models/users.dart' as user_model;

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future addFacultyToUsers(String authUid, String eMail,
      String facultyName, List<String> sections) async {
    faculty_model.Faculty faculty = faculty_model.Faculty(
      name: facultyName,
      sections: sections,
    );
    await FirebaseFirestore.instance.collection("users").doc(authUid).set(
          faculty.toJson(),
        );
  }

  Future addFacultytoSections(
      String uid, List<String> students, String section) async {
    String res = "Error";
    try {
      String name = await user_model.User.getFacultyName(uid).then((value) {
        String name = value;
        return name;
      });
      faculty_model.FacultySections facultySec =
          faculty_model.FacultySections(name: name, students: students);

      await firestore
          .collection("sections")
          .doc(section)
          .collection("Faculty advisors")
          .doc(uid)
          .set(
            facultySec.toJson(),
          );
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  // Signup Faculty not completed do not use
  Future<String> signupFaculty({
    required String email,
    required String password,
    required List<String> sections,
    required String name,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await addFacultyToUsers(
            userCredential.user!.uid.toString(), email, name, sections);

        List<String> students = [];
        for (var section in sections) {
          students = await user_model.User().getSectionStudentList(section);

          await addFacultytoSections(
              userCredential.user!.uid, students, section);
        }

        res = "Success";
      }
    } on FirebaseAuthException catch (e) {
      res = e.code.toString();
    }
    return res;
  }

  //login for faculty

  Future<String> loginFaculty({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res = "Success";
      } else {
        res = "empty-fields";
      }
    } on FirebaseAuthException catch (e) {
      res = e.code.toString();
    }
    return res;
  }
}
