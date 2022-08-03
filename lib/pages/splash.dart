// ignore_for_file: library_private_types_in_public_api

import 'package:fizzbizzapp/pages/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'Fizz Buzz')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: const Center(
          child: Text('Fizz Buzz',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
