import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insta_cut/ui/Home/View/home_view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final int _delaySecond = 3;

  @override
  void initState() {
    super.initState();
    _delayPage();
  }

  _delayPage() async {
    var duration = Duration(seconds: _delaySecond);
    return Timer(duration, gotoHome);
  }

  void gotoHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => HomeView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171717),
      body: Center(
        child:
            Image(height: 250, image: AssetImage("lib/assets/imgs/logo.png")),
      ),
    );
  }
}
