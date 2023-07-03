import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docscore_faculty/models/student.dart' as studentModel;
import 'package:docscore_faculty/models/faculty.dart' as facultyUsersModel;

class Section {
  static Future<List<String>> getSections() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("sections").get();
    List<String> sectionNames = [];
    querySnapshot.docs.forEach((doc) {
      sectionNames.add(doc.id);
    });
    return sectionNames;
  }

  static Future getSectionFacultyAdvisors(String SectionName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("sections")
        .doc(SectionName)
        .collection("Faculty advisors")
        .get();
    List<String> facultyAdvisors = [];
    querySnapshot.docs.forEach((doc) {
      facultyAdvisors.add(doc.id);
    });
    return facultyAdvisors;
  }

  static Future getStudentsfromUsers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "student")
        .get();
    List<String> documentNames = [];
    querySnapshot.docs.forEach((doc) {
      documentNames.add(doc.id);
    });
    return documentNames;
  }

  static Future getFacultyfromUsers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "faculty")
        .get();
    List<String> documentNames = [];
    querySnapshot.docs.forEach((doc) {
      documentNames.add(doc.id);
    });
    return documentNames;
  }

  static Future getStudentDocumentList(String regNo) async {
    DocumentSnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("users").doc(regNo).get();
    if (querySnapshot.exists) {
      return querySnapshot["Documents"];
    } else {
      return null;
    }
  }

  static Future addFacultyInSections(String eMail, List<String> sections) async{
    String uid = "";
    for(int i = 0; i< eMail.length;i++){
      if(eMail[i]=="@") break;
      uid += eMail[i];
    }
    facultyUsersModel.FacultySections faculty = facultyUsersModel.FacultySections(name: uid, students: ["RA2111051010002"]);
    for(int i=0;i<sections.length;i++){
      await FirebaseFirestore.instance.collection("sections").doc(sections[i]).collection("Faculty advisors").doc(uid).set(faculty.toJson());
    }
  }
}

