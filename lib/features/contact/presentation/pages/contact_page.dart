import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/rsponsive.dart';
import '../../../../core/widgets/mobile_menu.dart';
import '../widgets/appbar.dart';
import '../widgets/mobile_body.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
      drawer: Responsive.isMobile(context) ? buildMobileMenu(context, 4) : null,
      body: buildMobileBody(context),
    );
  }
}
