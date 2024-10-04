import 'package:portfolio_web_app/features/projects/domain/entities/projects_entity.dart';

import '../../domain/repositories/project_repository.dart';
import '../models/project_model.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  @override
  Future<List<ProjectEntity>> fetchProjects() {
    List<ProjectModel> projectList = [];
    List<String> urlList = [
      'assets/images/projects/kiksmart_project_cover.jpg',
      'assets/images/projects/springfix_project_cover.jpg',
      'assets/images/projects/test_project.jpg',
    ];
    List<String> descriptionList = [
      'Mobile Application to pair and manage IOT devices over WiFi and/or Cloud.',
      'Android Kiosk application for managing machines over MQTT in a factory environment.',
      'description33333',
    ];

    List<String> fulldescriptionList = [
      'Overview: \nThe application is built using the Flutter framework and is available on both Android and iOS platforms. It supports user registration, pairing multiple IoT devices over WiFi, and managing them locally via WebSocket or remotely through Firebase RTDB. Additionally, it provides background notifications to inform users of device status changes, sensor out-of-range alerts, and more. \nTools and Packages used: \nBLoC, GoRouter, GetIt, SharedPreffs, WebSocket, Firebase services (Auth, Functions, Realtime Database, Firestore), Charts, Smartconfig and more.',
      'Overview: \nThe Android Kiosk application, developed using the Flutter framework, is specially designed for use primarily on tablets. It utilizes an MQTT backend to connect with numerous machines, allowing workers to control them seamlessly using their RFID cards.\nTools and Packages used: \nBLoC, GoRouter, GetIt, SharedPreffs, MQTT, NFC and more.',
      '534gdfg dfg sdfg d',
    ];

    List<String> typeList = [
      'mobileApp',
      'mobileApp',
      'mobileApp',
    ];
    List<String> playStoreUrlList = ['url', 'url', 'url'];
    List<String> appStoreUrlList = ['url', '', ''];
    List<String> githubUrlList = ['', '', 'url'];
    List<String> apkUrlList = ['', '', ''];
    List<String> ipaUrlList = ['', '', ''];
    List<String> liveDemoUrlList = ['', '', 'url'];

    for (int a = 0; a < urlList.length; a++) {
      projectList.add(ProjectModel(
        imgUrl: urlList[a],
        projectDescription: descriptionList[a],
        projectFullDescription: fulldescriptionList[a],
        type: typeList[a],
        playStoreUrl: playStoreUrlList[a],
        appStoreUrl: appStoreUrlList[a],
        githubUrl: githubUrlList[a],
        apkUrl: apkUrlList[a],
        ipaUrl: ipaUrlList[a],
        liveDemoUrl: liveDemoUrlList[a],
      ));
    }

    return Future.value(projectList);
  }
}
