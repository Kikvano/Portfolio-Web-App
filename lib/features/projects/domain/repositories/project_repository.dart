import '../entities/projects_entity.dart';

abstract class ProjectRepository {
  Future<List<ProjectEntity>> fetchProjects();
}
