// ignore_for_file: unused_import, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:docscore_faculty/models/users.dart';
import 'package:docscore_faculty/models/faculty.dart' as faculty_model;

class AuthMethods{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future addFacultyToUsers(
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

  // Signup Faculty not completed do not use
  Future<String> signupFaculty({
    required String email,
    required String password,
    required List<String> sections,
    required String name
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await addFacultyToUsers(email, name, sections);
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
