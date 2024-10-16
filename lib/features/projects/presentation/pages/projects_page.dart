import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/rsponsive.dart';
import '../../../../core/widgets/mobile_menu.dart';
import '../../bloc/presentation_bloc.dart';
import '../../domain/entities/projects_entity.dart';
import '../widgets/appbar.dart';
import '../widgets/desktop_body.dart';
import '../widgets/mobile_body.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => ProjectsPageState();
}

class ProjectsPageState extends State<ProjectsPage> with TickerProviderStateMixin {
  late AnimationController loadingController;
  List<AnimationController> flipController = [];
  List<Animation> flipAnimation = [];

  List<bool> isVisible = [];
  List<ProjectEntity> projectList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<PresentationBloc>().add(PresentationInitialiseEvent());
    //isVisible = List.generate(5, (index) => false);
  }

  @override
  void initState() {
    super.initState();
    //_initializeAnimations();
    loadingController = AnimationController(vsync: this);
    loadingController.repeat(period: const Duration(milliseconds: 2000));

    //context.read<PresentationBloc>().add(PresentationInitialiseEvent());
  }

  void configureControllers(int length) {
    for (int a = 0; a < length; a++) {
      flipController.add(AnimationController(duration: const Duration(milliseconds: 600), vsync: this));
      flipAnimation.add(Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: flipController[a], curve: Curves.easeInOut),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor(context),
      appBar: Responsive.isMobile(context) ? appBar(context) : null,
      drawer: Responsive.isMobile(context) ? buildMobileMenu(context, 3) : null,
      body: BlocConsumer<PresentationBloc, PresentationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PresentationLoadedState) {
            projectList = state.projectList;
            configureControllers(projectList.length);
            for (int a = 0; a < projectList.length; a++) {
              isVisible.add(false);
            }
            return Responsive.isMobile(context)
                ? buildMobileBody(
                    context,
                    projectList,
                    isVisible,
                    flipController,
                    flipAnimation,
                  )
                : buildDesktopBody(
                    context,
                    projectList,
                    isVisible,
                    flipController,
                    flipAnimation,
                  );
          }
          return Center(
            child: Opacity(
              opacity: 0.05,
              child: Lottie.asset(
                'assets/animations/animation_1727694415537.json',
                controller: loadingController,
                width: 340,
                height: 340,
                fit: BoxFit.cover,
                onLoaded: (composition) {
                  loadingController.duration = composition.duration;
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    loadingController.dispose();
    for (int a = 0; a < flipController.length; a++) {
      flipController[a].dispose();
    }

    super.dispose();
  }
}
