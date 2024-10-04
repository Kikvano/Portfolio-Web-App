import '../../../../core/utils/usecase.dart';
import '../entities/projects_entity.dart';
import '../repositories/project_repository.dart';

class FetchProjects implements UseCase<List<ProjectEntity>, NoParams> {
  final ProjectRepository projectRepository;
  FetchProjects(this.projectRepository);

  @override
  Future<List<ProjectEntity>> call({NoParams? params}) async {
    return await projectRepository.fetchProjects();
  }
}
