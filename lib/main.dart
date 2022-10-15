
import 'package:flutter/material.dart';
import 'package:healthy_calculator/utils/app_routes.dart';
import 'navigation_drawer.dart';
import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.SPLASH: (ctx) => Splash(),
        AppRoutes.NAVIGATION_DRAWER: (ctx) => NavigationDrawer(),
      },
    );
  }
}

