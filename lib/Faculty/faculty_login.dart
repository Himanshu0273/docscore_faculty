// ignore_for_file: unused_field, sort_child_properties_last

import 'package:docscore_faculty/Faculty/faculty_home.dart';
import 'package:docscore_faculty/Faculty/faculty_signup.dart';
import 'package:docscore_faculty/resources/constants.dart';
import 'package:docscore_faculty/resources/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:docscore_faculty/widgets/text_input.dart';
import 'package:docscore_faculty/resources/auth/auth_method.dart';
import 'package:docscore_faculty/Faculty/utils/utils.dart';

class FacultyLoginScreen extends StatefulWidget {
  const FacultyLoginScreen({super.key});

  @override
  State<FacultyLoginScreen> createState() => _FacultyLoginScreenState();
}

class _FacultyLoginScreenState extends State<FacultyLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _loginFaculty() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().loginFaculty(
      email: _emailController.text.toString().trim(),
      password: _passwordController.text.toString().trim(),
    );

    setState(() {
      _isLoading = false;
    });
    if (res == "Success") {
      replaceScreen(context, faculty_homepage());
    } else if (res == "empty-fields") {
      showSnackBar("Please enter all the fields", context);
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

                      // Login button
                      InkWell(
                        onTap: _loginFaculty,
                        child: Container(
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              : const Text("Login"),
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
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                          InkWell(
                            onTap: () {
                              nextScreen(context, FacultySignupPage());
                            },
                            child: const Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ])),
          ),
        ),
      ),
    );
  }
}
