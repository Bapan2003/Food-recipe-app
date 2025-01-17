/*
 * Copyright (c) Uphead Management 2024.  All rights reserved.
 * No part of this code may be reproduced, distributed, or transmitted in any form or by any means,
 * including photocopying, recording, or other electronic or mechanical methods.
 */

import 'package:Food/pages/dashboard/dashboard.dart';
import 'package:Food/theme/color.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  static const String rootName='splashScreen';
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: whiteColor,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.only(left:35,right: 35 ,),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  ),
                );
              },
              child: Image.asset('assets/images/Foodie.png'), // Replace with your image
            ),
          ),
        ),
      ),
    );
  }

  Future<void> initializeData() async {
    // Initialize the AnimationController

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Define the scale (zoom) animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation
    _controller.forward();

    // Navigate to another screen after the animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
          Navigator.pushReplacementNamed(context, DashboardPageScreen.rootName);
      }
    });
  }
}