import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ActualApp());
}



class ActualApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FinalHomePage2(),
    );
  }
}
