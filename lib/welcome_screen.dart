import 'package:flutter/material.dart';
import 'package:home_work_4/config/colors.dart';
import 'package:home_work_4/config/strings.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Container(
              width: double.infinity,
              child: Image.asset(
                "assets/images/welcome_bg.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                AppText.welcomeText1,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 8),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.center,
                AppText.welcomeText2,
                style: const TextStyle(
                    color: Color(0xffd6d2d2),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 66),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff5edfff)),
                child: Text(
                  AppText.welcomeText3,
                  style: const TextStyle(
                      color: Color(0xff263238),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
