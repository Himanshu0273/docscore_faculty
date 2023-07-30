import 'package:docscore_faculty/resources/constants/colors.dart';
import 'package:flutter/material.dart';

class FacultyProfile extends StatelessWidget {
  const FacultyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: backgroundGradient()),
          ),
          Positioned(
            top: 0,
            bottom: MediaQuery.of(context).size.height * 0.68,
            left: 0,
            right: 0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar()
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
