import 'package:docscore_faculty/Faculty/docsuploaded.dart';
import 'package:docscore_faculty/Faculty/faculty_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:docscore_faculty/Faculty/faculty_home.dart';

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
    return MaterialApp(
      title: 'Docscore',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: docs_uploaded(),
      // home: StreamBuilder(
      //   stream: AuthMethods().auth.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return const Student_home_page();
      //     }
      //     return StudentSignup();
      //   },
      // ),
    );
  }
}
