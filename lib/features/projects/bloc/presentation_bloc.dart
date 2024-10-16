import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/projects_entity.dart';
import '../domain/usecases/fetch_projects.dart';

part 'presentation_event.dart';
part 'presentation_state.dart';

class PresentationBloc extends Bloc<PresentationEvent, PresentationState> {
  final FetchProjects fetchProjects;

  PresentationBloc({required this.fetchProjects}) : super(PresentationInitialState()) {
    on<PresentationInitialiseEvent>(presentationInitialiseEvent);
  }

  FutureOr<void> presentationInitialiseEvent(PresentationInitialiseEvent event, Emitter<PresentationState> emit) async {
    emit(PresentationInitialState());

    var result = await fetchProjects();

    await Future.delayed(const Duration(milliseconds: 1000));

    emit(PresentationLoadedState(projectList: result));
  }
}
