import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<Widget> buildDesktopMenu(BuildContext context) {
  return [
    IconButton(
      icon: const Icon(Icons.person),
      onPressed: () => GoRouter.of(context).go('/about'),
    ),
    IconButton(
      icon: const Icon(Icons.work),
      onPressed: () => GoRouter.of(context).go('/experience'),
    ),
    IconButton(
      icon: const Icon(Icons.folder),
      onPressed: () => GoRouter.of(context).go('/projects'),
    ),
    IconButton(
      icon: const Icon(Icons.contact_mail),
      onPressed: () => GoRouter.of(context).go('/contact'),
    ),
  ];
}
