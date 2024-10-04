// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ProjectEntity {
  final String imgUrl;
  final String projectDescription;
  final String projectFullDescription;
  final String type;
  final String playStoreUrl;
  final String appStoreUrl;
  final String githubUrl;
  final String apkUrl;
  final String ipaUrl;
  final String liveDemoUrl;

  ProjectEntity({
    required this.imgUrl,
    required this.projectDescription,
    required this.projectFullDescription,
    required this.type,
    required this.playStoreUrl,
    required this.appStoreUrl,
    required this.githubUrl,
    required this.apkUrl,
    required this.ipaUrl,
    required this.liveDemoUrl,
  });
}
