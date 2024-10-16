import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppTheme.appBackgroundColor(context),
    title: Align(
      alignment: Alignment.centerRight,
      child: Text('ABOUT ME', style: TextStyle(color: AppTheme.primaryTextColor(context), fontWeight: FontWeight.bold)),
    ),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.menu_rounded, color: AppTheme.primaryTextColor(context), size: 40),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),
  );
}
