import '../../domain/entities/projects_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({
    required super.imgUrl,
    required super.projectDescription,
    required super.type,
    required super.playStoreUrl,
    required super.appStoreUrl,
    required super.githubUrl,
    required super.apkUrl,
    required super.ipaUrl,
    required super.liveDemoUrl,
    required super.projectFullDescription,
  });

  /*factory ProjectModel.initial() {
    return ProjectModel(
      imgUrl: '',
      projectDescription: '',
      type: '',
    );
  }*/
}
