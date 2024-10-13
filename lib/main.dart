import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(CerclageMonitorApp());
}

class CerclageMonitorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cerclage Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}