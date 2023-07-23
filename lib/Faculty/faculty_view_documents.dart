import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewDocuments extends StatelessWidget {
  const ViewDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF1F2C45),
                    Color(0xFF274B93),
                    Color(0XFF2A519D),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xffD9D9D9),
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 40,
                        width: 105,
                        child: Image.asset(
                          'assets/SRM_1.jpg',
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text("   Name: Debargha Das", style: GoogleFonts.montserrat(color: Colors.white),),
                Text("   Registration Number: RA2111051010002", style: GoogleFonts.montserrat(color: Colors.white),),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 70,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)
                    ),
                    child: Center(child: Text("Documents Uploaded", style: GoogleFonts.montserrat(fontSize: 17),)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
