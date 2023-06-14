import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:report4/pages/home/home_page.dart';
import 'package:report4/pages/login/login_page.dart';

class SplashPage extends StatefulWidget {
  final token;
  const SplashPage({Key? key, this.token}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn);
    _animationController.forward();
    Timer(
        const Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => widget.token != null
                    ? HomePage(
                        token: widget.token,
                      )
                    : const LoginPage())));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: SvgPicture.asset(
            "assets/icons/splash_icon.svg",
            height: 70,
          ),
        ),
      ),
    );
  }
}
