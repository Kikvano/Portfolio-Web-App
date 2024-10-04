part of 'presentation_bloc.dart';

sealed class PresentationState {}

final class PresentationInitialState extends PresentationState {}

final class PresentationLoadedState extends PresentationState {
  final List<ProjectEntity> projectList;

  PresentationLoadedState({required this.projectList});
}
