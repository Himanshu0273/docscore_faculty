import 'package:docscore_faculty/models/sections.dart';
import 'package:flutter/material.dart';
import 'package:docscore_faculty/models/users.dart';

class TestingKeLiye extends StatelessWidget {
  const TestingKeLiye({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LMAO NOOB HO KYA"),
      ),
      body: ElevatedButton(
        onPressed: () async {
          // print(User.getFacultyName());
        },
        child: Text("DABAO"),
      ),
    );
  }
}
