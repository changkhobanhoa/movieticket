import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 1000));
    _animation=CurvedAnimation(parent: _animationController,curve: Curves.bounceOut,reverseCurve: Curves.bounceIn);
    _animationController.forward();
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: ScaleTransition(scale: _animation,child: SvgPicture.asset("assets/icons/splash_icon.svg",height: 70,),),
      ),
    );
  }
}
