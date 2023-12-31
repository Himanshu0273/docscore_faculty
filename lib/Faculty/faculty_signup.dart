// ignore_for_file: unused_field, sort_child_properties_last, unused_import, use_build_context_synchronously

import 'package:docscore_faculty/Faculty/faculty_home.dart';
import 'package:docscore_faculty/Faculty/faculty_login.dart';
import 'package:docscore_faculty/resources/constants.dart';
import 'package:docscore_faculty/resources/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:docscore_faculty/widgets/text_input.dart';
import 'package:docscore_faculty/resources/auth/auth_method.dart';
import 'package:docscore_faculty/Faculty/utils/utils.dart';
import 'package:docscore_faculty/models/sections.dart' as section_model;

class FacultySignupPage extends StatefulWidget {
  const FacultySignupPage({super.key});

  @override
  State<FacultySignupPage> createState() => _FacultySignupPageState();
}

class _FacultySignupPageState extends State<FacultySignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _sectionController = TextEditingController();
  final _nameController = TextEditingController();
  List<String> _selectedItems = [];
  bool _isLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _sectionController.dispose();
    _nameController.dispose();
  }

  void _signupFaculty() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signupFaculty(
      email: _emailController.text,
      password: _passwordController.text,
      sections: _selectedItems,
      name: _nameController.text,
    );

    setState(() {
      _isLoading = false;
      Navigator.pop(context);
    });

    if (res == "Success") {
      nextScreen(context, faculty_homepage());
      showSnackBar("Signup Success", context);
    } else {
      showSnackBar("Signup Failed", context);
    }
  }

  void showMultiSelect() async {
    final List<String> sections = await section_model.Section.getSections();

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: sections);
      },
    );
    if (results != null) {
      setState(() {
        _selectedItems = results;
        _sectionController.text = results.join(", ");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: backgroundGradient(),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 12,
                right: 12,
                bottom: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SVG image

                  Image.asset(
                    'assets/SRM_1.jpg',
                    height: 70,
                  ),

                  const SizedBox(
                    height: 64,
                  ),

                  // Name input
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextInput(
                      textEditingController: _nameController,
                      hintText: 'Name',
                      textInputType: TextInputType.text,
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  // Email input
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextInput(
                      textEditingController: _emailController,
                      hintText: 'SRM Email',
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),
                  //Password input
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInput(
                      textEditingController: _passwordController,
                      hintText: 'Password',
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      readOnly: true,
                      controller: _sectionController,
                      onTap: showMultiSelect,
                      decoration: InputDecoration(
                        hintText: "Select Sections",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),

                  // Login button
                  InkWell(
                    onTap: _signupFaculty,
                    child: Container(
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : const Text("Signup"),
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Text("Don't have an account? ",
                            style: TextStyle(color: Colors.grey[300])),
                      ),
                      GestureDetector(
                        onTap: () {
                          nextScreen(context, FacultyLoginScreen());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text(
                            " Login",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
