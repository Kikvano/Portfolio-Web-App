import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/router.dart';
import '../theme/theme.dart';

Widget buildMobileMenu(BuildContext context, int page) {
  List<bool> isTileHovered = [false, false, false, false, false];

  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Drawer(
      backgroundColor: AppTheme.appBackgroundColor(context),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(color: AppTheme.appBackgroundColor(context)),
              child: Text(
                'Irakli Kikvadze',
                style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (page != 0)
            InkWell(
              onHover: (value) => setState(() => isTileHovered[0] = value),
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.home, color: isTileHovered[0] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context)),
                title: Text('Home', style: TextStyle(color: isTileHovered[0] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context), fontWeight: FontWeight.bold)),
                hoverColor: AppTheme.primaryActionColor(context),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  context.pushNamed(AppRoutes.homeRoute);
                },
              ),
            ),
          if (page != 1)
            InkWell(
              onHover: (value) => setState(() => isTileHovered[1] = value),
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.person, color: isTileHovered[1] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context)),
                title: Text('About', style: TextStyle(color: isTileHovered[1] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context), fontWeight: FontWeight.bold)),
                hoverColor: AppTheme.primaryActionColor(context),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  context.pushNamed(AppRoutes.aboutRoute);
                },
              ),
            ),
          if (page != 2)
            InkWell(
              onHover: (value) => setState(() => isTileHovered[2] = value),
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.work, color: isTileHovered[2] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context)),
                title: Text('Skills', style: TextStyle(color: isTileHovered[2] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context), fontWeight: FontWeight.bold)),
                hoverColor: AppTheme.primaryActionColor(context),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  context.pushNamed(AppRoutes.experianceRoute);
                },
              ),
            ),
          if (page != 3)
            InkWell(
              onHover: (value) => setState(() => isTileHovered[3] = value),
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.folder, color: isTileHovered[3] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context)),
                title: Text('Projects', style: TextStyle(color: isTileHovered[3] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context), fontWeight: FontWeight.bold)),
                hoverColor: AppTheme.primaryActionColor(context),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  context.pushNamed(AppRoutes.projectsRoute);
                },
              ),
            ),
          /*  if (page != 4)
            InkWell(
              onHover: (value) => setState(() => isTileHovered[4] = value),
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.contact_mail, color: isTileHovered[4] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context)),
                title: Text('Contact', style: TextStyle(color: isTileHovered[4] ? AppTheme.appBackgroundColor(context) : AppTheme.primaryTextColor(context), fontWeight: FontWeight.bold)),
                hoverColor: AppTheme.primaryActionColor(context),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  context.pushNamed(AppRoutes.contactRoute);
                },
              ),
            ),
      */
        ],
      ),
    );
  });
}
