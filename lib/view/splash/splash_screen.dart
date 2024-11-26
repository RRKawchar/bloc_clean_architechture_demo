import 'package:bloc_clean_architecture/services/splash/splash_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SplashService.onCheckSplash(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash "),
      ),
      body: const Center(
        child: Text("Splash Screen",style: TextStyle(fontSize: 50))
      ),
    );
  }
}
