import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:google_fonts/google_fonts.dart';

class stud_doc extends StatelessWidget {
  stud_doc({super.key});
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            '10th Marksheet',
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null && result.files.isNotEmpty) {
                String filePath = result.files.first.path!;
                _openFile(filePath);
              } else {
                // User canceled the file picking
              }
            },
            child: Text(
              'Open File',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: Colors.blue,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isChecked ? Colors.blue : Colors.transparent,
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      child: _isChecked
                          ? const Icon(
                              Icons.check,
                              size: 24.0,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isChecked ? Colors.blue : Colors.transparent,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        child: _isChecked
                            ? const Icon(
                                Icons.cancel,
                                size: 24.0,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
