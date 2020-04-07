import 'package:flutter/material.dart';

//  UI Imports
import 'package:csjuniorseminar/View/Controller.dart';
import 'package:csjuniorseminar/View/AssassinHomePage.dart';

void main() => runApp(AssassinApp());

class AssassinApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Controller.title,
      theme: ThemeData(
        primarySwatch: Controller.primarySwatch,
      ),
      home: AssassinHomePage(title: Controller.homePageTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}
