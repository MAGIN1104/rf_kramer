import 'package:flutter/material.dart';

class CardHomeInformation extends StatelessWidget {
  CardHomeInformation({required this.ctitle, required this.cdescription});
  String ctitle;
  String cdescription;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ctitle,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Text(
              cdescription,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
