import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

Widget buildMobileBody(BuildContext context) {
  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("About Me", style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 35, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  //Row(children: [Icon(Icons.info, color: AppTheme.primaryActionColor(context))]),
                  Text(
                    'I am a Mobile Application Developer, Embedded Hardware and Software Engineer, PCB Designer & Telecoms Engineer with years of experience based in Georgia.',
                    style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'My current focus is on building well-crafted mobile applications that not only look great but also provide a seamless user experience for both Android and iOS',
                    style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'In addition, I am available as your full-stack hardware designer, offering comprehensive services from project inception to final product. These services include firmware development, prototyping, hardware and PCB design, sample assembly, 3D printing, and more.',
                    style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Whether you need a cross platform Mobile application, sophisticated home automation system, a robust monitoring solution, an industrial controller, or a simple mobile app to manage your IOT devices, I am here to help you achieve your goals.',
                    style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}
