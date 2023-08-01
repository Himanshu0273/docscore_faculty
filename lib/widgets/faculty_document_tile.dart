import 'package:docscore_faculty/Faculty/utils/utils.dart';
import 'package:flutter/material.dart';

class DocumentTile extends StatefulWidget {
  const DocumentTile({
    super.key,
    required this.documentName,
    required this.docData,
  });

  final String documentName;
  final Map<String, dynamic> docData;

  @override
  State<DocumentTile> createState() =>
      _DocumentTileState(documentName: documentName, docData: docData);
}

class _DocumentTileState extends State<DocumentTile> {
  final String documentName;
  final Map<String, dynamic> docData;

  _DocumentTileState({required this.documentName, required this.docData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FittedBox(
                  child: Text(
                    widget.documentName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check, color: Colors.green),
                    ),
                    // int _verification = docData["verification"]
                    // switch(
                    //    docData["verification"] as
                    // ){
                    //      IconButton(
                    //         onPressed: () {},
                    //         icon: const Icon(
                    //           Icons.close,
                    //           color: Colors.grey,
                    //         ),
                    //       )
                    // }
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 70,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () {
                      launchInBrowser(Uri.parse(docData["url"]));
                    },
                    child: const Text(
                      "View",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
