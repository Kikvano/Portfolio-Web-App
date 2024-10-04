import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/rsponsive.dart';
import '../../../../core/widgets/mobile_menu.dart';
import '../widgets/appbar.dart';
import '../widgets/mobile_body.dart';

class ExperiancePage extends StatefulWidget {
  const ExperiancePage({super.key});

  @override
  State<ExperiancePage> createState() => _ExperiancePageState();
}

class _ExperiancePageState extends State<ExperiancePage> {
  @override
  void initState() {
    super.initState();
    //_initializeAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor(context),
      appBar: Responsive.isMobile(context) ? appBar(context) : null,
      drawer: Responsive.isMobile(context) ? buildMobileMenu(context, 2) : null,
      body: buildMobileBody(context),
    );
  }
}
