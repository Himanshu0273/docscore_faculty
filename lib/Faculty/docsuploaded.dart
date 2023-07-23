import 'package:flutter/material.dart';
import 'package:docscore_faculty/resources/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:docscore_faculty/resources/constants/stud_document.dart';
import '../widgets/text_input.dart';

// ignore: camel_case_types
class docs_uploaded extends StatelessWidget {
  docs_uploaded({super.key});
  //final TextEditingController _inputController = TextEditingController();
  //String headingText = 'Default Heading';
  Future<void> _openFile(String filePath) async {
    try {
      final result = await OpenFile.open(filePath);
      print(result);
    } catch (e) {
      print('Error opening file: $e');
    }
  }

  bool _isChecked = false;
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
            child: Column(
              children: [
                Row(
                  children: [
                    //Title : Docs Uploaded
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 20.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              color: Color(0xffD9D9D9),
                              size: 30,
                            ),
                          ),
                          Text(
                            'Docs uploaded',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/SRM_1.jpg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  textAlign: TextAlign.start,
                  'Registration Number : ',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffD9D9D9),
                  ),
                ),
                //Input registration number
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //       vertical: 10.0, horizontal: 20.0),
                //   child: TextInput(
                //     textEditingController: _inputController,
                //     hintText: 'Enter Registration Number',
                //     textInputType: TextInputType.number,
                //   ),
                // ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  textAlign: TextAlign.start,
                  'Name : ',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffD9D9D9),
                  ),
                ),
                //Input Name
                //Please help:(
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD9D9D9),
                  ),
                  child: Center(
                    child: Text(
                      'Documents',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //Taskbar
                //isko end mei banayenge
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff0D0750),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Uploaded',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Upload Pending',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: Text(
                    'Verify',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // List of docs
                stud_doc(),
                stud_doc(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
