import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/rsponsive.dart';
import '../../../../core/widgets/mobile_menu.dart';
import '../../bloc/about_bloc.dart';
import '../widgets/appbar.dart';
import '../widgets/desktop_body.dart';
import '../widgets/mobile_body.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
      drawer: Responsive.isMobile(context) ? buildMobileMenu(context, 1) : null,
      body: BlocBuilder<AboutBloc, AboutState>(
        builder: (context, state) {
          if (state is AboutLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AboutLoaded) {
            return Center(child: Text(state.aboutInfo));
          } else if (state is AboutError) {
            return Center(child: Text(state.message));
          }
          return Responsive.isMobile(context) ? buildMobileBody(context) : buildDesktopBody(context);
        },
      ),
    );
  }
}
