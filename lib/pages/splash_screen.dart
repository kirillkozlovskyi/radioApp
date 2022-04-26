import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/app_load.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer( const Duration(seconds: 3),
        () => Navigator.pushReplacement( context, MaterialPageRoute(
            builder: (context) => const HomePage()
        ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff0C0D31),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: const AppLoadProgressbar(),
            ),
            const SizedBox(height: 100.0),
            Image.asset('assets/images/splashGrafics.png')
          ],
        ),
      ),
    );
  }
}

