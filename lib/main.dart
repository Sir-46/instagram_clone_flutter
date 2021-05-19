import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/pages/ChatPage.dart';
import 'package:instagram_clone_flutter/pages/app.dart';
// import 'package:instagram_clone_flutter/pages/SearchPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone Flutter ',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.greenAccent,
      ),
      // home: App(),
      initialRoute: '/',
      routes: {'/': (context) => App(), '/chat': (context) => ChatPage()},
    );
  }
}
