import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppTheme.appBackgroundColor(context),
    //title: Text('About Me', style: TextStyle(color: AppTheme.primaryTextColor(context))),
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
