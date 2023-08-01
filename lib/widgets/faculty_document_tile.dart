import 'package:flutter/material.dart';

class DocumentTile extends StatefulWidget {
  DocumentTile({super.key, required this.documentName});

  final String documentName;

  @override
  State<DocumentTile> createState() => _DocumentTileState();
}

class _DocumentTileState extends State<DocumentTile> {
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
                FittedBox(child: Text(widget.documentName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 15),),),
                Row(
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.check, color: Colors.green),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    )
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
