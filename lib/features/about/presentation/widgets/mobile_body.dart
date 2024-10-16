import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/theme.dart';

Widget buildMobileBody(BuildContext context) {
  Future<void> urlLauncher(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text("ABOUT ME", style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 35, fontWeight: FontWeight.bold)),
            //const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 12.0, right: 12, top: 0, bottom: 15),
              decoration: BoxDecoration(
                color: AppTheme.appBackgroundColor(context),
                borderRadius: BorderRadius.circular(16), // Rounded corners
                //border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
                //boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 0))],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    //Row(children: [Icon(Icons.info, color: AppTheme.primaryActionColor(context))]),
                    Text(
                      'I am a Mobile Application Developer, Embedded Hardware and Software Engineer, PCB Designer & Telecoms Engineer with years of experience based in Georgia.',
                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'My current focus is on building well-crafted mobile applications that not only look great but also provide a seamless user experience for both Android and IOS. I follow OOP and clean architecture principles, use BLoC pattern for state management to ensure scalable, maintainable, and high-quality code. I have experience in working with REST APIs, WebSockets and MQTT for backend communications, as well as services like Firebase and Supabase.',
                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'In addition, I am available as your full-stack hardware designer, offering comprehensive services from project inception to final product. These services include firmware development, prototyping, hardware and PCB design, sample assembly, 3D printing, and more.',
                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Whether you need a cross platform Mobile application, sophisticated home automation system, a robust monitoring solution, an industrial controller, or a simple mobile app to manage your IOT devices, I am here to help you achieve your goals.',
                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 30),
                    /*  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => urlLauncher(Uri.parse('https://linkedin.com/in/irakli-kikvadze-a79151314')),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image.asset(
                            'assets/images/linkedin_icon_128.png',
                            width: 128,
                            height: 128,
                            color: AppTheme.primaryTextColor(context),
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          onTap: () => urlLauncher(Uri(scheme: 'mailto', path: 'kikvano@gmail.com')),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image.asset(
                            'assets/images/email_icon_128.png',
                            width: 128,
                            height: 128,
                            color: AppTheme.primaryTextColor(context),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                 */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
