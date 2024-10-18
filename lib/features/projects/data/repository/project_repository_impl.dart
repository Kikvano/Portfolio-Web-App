import 'package:portfolio_web_app/features/projects/domain/entities/projects_entity.dart';

import '../../domain/repositories/project_repository.dart';
import '../models/project_model.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  @override
  Future<List<ProjectEntity>> fetchProjects() {
    List<ProjectModel> projectList = [];
    List<String> urlList = [
      'assets/images/projects/portfolio_project_cover.jpg',
      'assets/images/projects/kiksmart_project_cover.jpg',
      'assets/images/projects/springfix_project_cover.jpg',
      'assets/images/projects/greenhouse_project_cover.jpg',
      'assets/images/projects/gh_pcb_project_cover.jpg',
    ];
    List<String> descriptionList = [
      'Cross-Platform Portfolio Application',
      'Mobile Application for pairing and controlling IOT devices over WiFi and/or Cloud.',
      'Android Kiosk application for managing machines over MQTT in a factory environment.',
      'Universal fully automated GreenHouse climate controller.',
      'Custom PCB for an IOT project based on ESP32 MCU.',
    ];

    List<String> fulldescriptionList = [
      'Overview: \nApplication with fully responsive design fitted for any screen size and/or orientation, built using the Flutter framework for Android, iOS and Web platforms. Highlighting my skills, experience and some of my projects.\nTools and Packages used:\nBLoC, GoRouter, GetIt, Firebase Hosting.',
      'Overview: \nThe application is built using Flutter and is available on both Android and iOS platforms. It supports user registration, pairing multiple IoT devices over WiFi, and managing them locally via WebSocket or remotely through Firebase RTDB. Additionally, it provides background notifications to inform users of device status changes, sensor out-of-range alerts, and more. \nTools and Packages used: \nBLoC, GoRouter, GetIt, SharedPreffs, WebSocket, Firebase services (Auth, Functions, Realtime Database, Firestore), Charts, Smartconfig and more.',
      'Overview: \nThe Android Kiosk application, developed using the Flutter framework, is specially designed for use primarily on tablets. It utilizes an MQTT backend to connect with numerous machines, allowing workers to control them seamlessly using their RFID cards.\nTools and Packages used: \nBLoC, GoRouter, GetIt, SharedPreffs, MQTT, NFC and more.',
      'Overview: \nCompletely handmade IOT project designed to automate the growing process inside greenhouses, grow tents, etc. Controller can be used for both Soil and Hydroponic setups. Equipped with 2.8" touch screen display, it offers pairing and control via mobile application (locally or remote over cloud), ability to connect various Analog and Digital Sensors, automated control solutions (with time, In cycle or by sensor value), App background notifications (on relay or sensor status changes), history of Sensors and Relay activity, Live Monitoring and more.\nTools and Packages used: \nPlatformIO/C++ (Embedded software), Kicad (PCB design), Flutter (Cross-platform mobile application).',
      'Overview: \nPCB design built over ESP32 2.4GHz WiFi MCU. Powered by 220v/110v AC with DC/DC isolated power for stable operation as well as opto-isolated 4x independent relays. Equipped with high precision analog receiver for working with various sensors, onboard clock module, LCD connector and expansion module slot for additional LoRa and Bluetooth devices integration. Local memory for sensor data, over-the-air firmware updates and more.\nTools and Packages used: \nPCB designed using Kicad software',
    ];

    List<String> typeList = [
      'mobileApp',
      'mobileApp',
      'mobileApp',
      'embedded',
      'pcb',
    ];
    List<String> playStoreUrlList = ['', 'https://play.google.com/store/apps/details?id=com.kikva.kiksmart', 'https://play.google.com/store/apps/details?id=com.springfix.mqtt', '', ''];
    List<String> appStoreUrlList = ['', 'url', '', '', ''];
    List<String> githubUrlList = ['', '', '', '', ''];
    List<String> apkUrlList = ['https://drive.google.com/file/d/1nxCpMSiqooLwuy2cGla6gyR2NCaHts_1/view?usp=sharing', '', '', '', ''];
    List<String> ipaUrlList = ['', '', '', '', ''];
    List<String> liveDemoUrlList = ['https://portfolio-e5f72.web.app', '', '', '', ''];

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
