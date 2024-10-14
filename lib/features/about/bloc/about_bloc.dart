import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial());

  Stream<AboutState> mapEventToState(AboutEvent event) async* {
    if (event is FetchAboutInfo) {
      yield AboutLoading();
      try {
        // Simulate fetching data (e.g., from Firebase or an API)
        await Future.delayed(Duration(seconds: 2));
        yield AboutLoaded("Your about section content here.");
      } catch (e) {
        yield AboutError("Failed to load about section.");
      }
    }
  }
}
