import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/router.dart';
import '../theme/theme.dart';
import '../utils/screensize.dart';

List<Widget> buildDesktopMenu(BuildContext context, int page) {
  int alphaValue = 200;
  double fontSize() => ScreenSize.width(context) / 2 < 700 ? ScreenSize.width(context) / 70 : 23;
  ButtonStyle buttonStyle = ButtonStyle(
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return AppTheme.primaryTextColor(context).withAlpha(20);
        }
        if (states.contains(WidgetState.pressed)) {
          return AppTheme.primaryTextColor(context).withAlpha(20);
        }
        return null; // Default color
      },
    ),
  );

  return [
    TextButton.icon(
      label: Text('HOME', style: TextStyle(fontSize: fontSize(), fontWeight: FontWeight.bold, color: page == 0 ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context).withAlpha(alphaValue))),
      icon: Icon(Icons.home, color: page == 0 ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context).withAlpha(alphaValue), size: fontSize() * 0.9),
      onPressed: () => context.pushNamed(AppRoutes.homeRoute),
      style: buttonStyle,
    ),
    TextButton.icon(
      label: Text('ABOUT ME', style: TextStyle(fontSize: fontSize(), fontWeight: FontWeight.bold, color: page == 1 ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context).withAlpha(alphaValue))),
      icon: Icon(Icons.person, color: page == 1 ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context).withAlpha(alphaValue), size: fontSize() * 0.9),
      onPressed: () => context.pushNamed(AppRoutes.aboutRoute),
      style: buttonStyle,
    ),
    TextButton.icon(
      label: Text('SKILLS', style: TextStyle(fontSize: fontSize(), fontWeight: FontWeight.bold, color: page == 2 ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context).withAlpha(alphaValue))),
      icon: Icon(Icons.work, color: page == 2 ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context).withAlpha(alphaValue), size: fontSize() * 0.9),
      onPressed: () => context.pushNamed(AppRoutes.experianceRoute),
      style: buttonStyle,
    ),
    TextButton.icon(
      label: Text('PROJECTS', style: TextStyle(fontSize: fontSize(), fontWeight: FontWeight.bold, color: page == 3 ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context).withAlpha(alphaValue))),
      icon: Icon(Icons.folder, color: page == 3 ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context).withAlpha(alphaValue), size: fontSize() * 0.9),
      onPressed: () => context.pushNamed(AppRoutes.projectsRoute),
      style: buttonStyle,
    ),
  ];
}
