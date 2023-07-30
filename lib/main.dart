import 'package:docscore_faculty/Faculty/docsuploaded.dart';
import 'package:docscore_faculty/Faculty/faculty_login.dart';
import 'package:docscore_faculty/Faculty/faculty_proifle.dart';
import 'package:docscore_faculty/Faculty/faculty_signup.dart';
import 'package:docscore_faculty/Faculty/faculty_view_documents.dart';
import 'package:docscore_faculty/Faculty/faculty_view_students.dart';
import 'package:docscore_faculty/models/testingkeliye.dart';
import 'package:docscore_faculty/resources/auth/auth_method.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:docscore_faculty/Faculty/faculty_home.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Docscore',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: AuthMethods().auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return faculty_homepage();
          }
          return FacultyLoginScreen();
        },
      ),
    );
  }
}
