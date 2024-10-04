import 'package:flutter/material.dart';

Widget buildMobileBody(BuildContext context) {
  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Center(
      child: Text(
        "sometext",
        style: TextStyle(color: Colors.white),
      ),
    );
  });
}
