import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/router.dart';
import '../theme/theme.dart';
import '../utils/screensize.dart';

List<Widget> buildDesktopMenu(BuildContext context) {
  int alphaValue = 200;
  double FontSize() => ScreenSize.width(context) / 2 < 700 ? ScreenSize.width(context) / 70 : 23;

  return [
    TextButton.icon(
      label: Text('HOME', style: TextStyle(fontSize: FontSize(), fontWeight: FontWeight.bold, color: AppTheme.primaryTextColor(context).withAlpha(alphaValue))),
      icon: Icon(Icons.home, color: AppTheme.primaryTextColor(context).withAlpha(alphaValue), size: FontSize() * 0.9),
      onPressed: () => context.pushNamed(AppRoutes.homeRoute),
    ),
    TextButton.icon(
      label: Text('ABOUT ME', style: TextStyle(fontSize: FontSize(), fontWeight: FontWeight.bold, color: AppTheme.primaryTextColor(context).withAlpha(alphaValue))),
      icon: Icon(Icons.person, color: AppTheme.primaryTextColor(context).withAlpha(alphaValue), size: FontSize() * 0.9),
      onPressed: () => context.pushNamed(AppRoutes.aboutRoute),
    ),
    TextButton.icon(
      label: Text('SKILLS', style: TextStyle(fontSize: FontSize(), fontWeight: FontWeight.bold, color: AppTheme.primaryTextColor(context).withAlpha(alphaValue))),
      icon: Icon(Icons.work, color: AppTheme.primaryTextColor(context).withAlpha(alphaValue), size: FontSize() * 0.9),
      onPressed: () => context.pushNamed(AppRoutes.experianceRoute),
    ),
    TextButton.icon(
      label: Text('PROJECTS', style: TextStyle(fontSize: FontSize(), fontWeight: FontWeight.bold, color: AppTheme.primaryTextColor(context).withAlpha(alphaValue))),
      icon: Icon(Icons.folder, color: AppTheme.primaryTextColor(context).withAlpha(alphaValue), size: FontSize() * 0.9),
      onPressed: () => context.pushNamed(AppRoutes.projectsRoute),
    ),
  ];
}
