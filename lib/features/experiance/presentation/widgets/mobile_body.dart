import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

Widget buildMobileBody(BuildContext context) {
  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Center(
      child: Column(
        children: [
          Text(
            "Experiance",
            style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 25),
          ),
        ],
      ),
    );
  });
}
