import 'package:get_it/get_it.dart';

import 'features/about/bloc/about_bloc.dart';
import 'features/projects/bloc/presentation_bloc.dart';
import 'features/projects/data/repository/project_repository_impl.dart';
import 'features/projects/domain/repositories/project_repository.dart';
import 'features/projects/domain/usecases/fetch_projects.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Use Cases
  sl.registerLazySingleton(() => FetchProjects(sl<ProjectRepository>()));

  // Repository
  sl.registerLazySingleton<ProjectRepository>(() => ProjectRepositoryImpl());

  //Bloc-Cubit
  sl.registerLazySingleton<AboutBloc>(() => AboutBloc());
  sl.registerLazySingleton<PresentationBloc>(() => PresentationBloc(fetchProjects: sl()));
}
