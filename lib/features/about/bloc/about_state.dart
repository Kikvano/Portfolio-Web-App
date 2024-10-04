part of 'about_bloc.dart';

abstract class AboutState {}

class AboutInitial extends AboutState {}

class AboutLoading extends AboutState {}

class AboutLoaded extends AboutState {
  final String aboutInfo;
  AboutLoaded(this.aboutInfo);
}

class AboutError extends AboutState {
  final String message;
  AboutError(this.message);
}
