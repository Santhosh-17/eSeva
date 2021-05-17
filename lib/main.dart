import 'package:flutter/material.dart';
import 'package:e_seva/pages/home_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xFF0A0E21),
            scaffoldBackgroundColor: Color(0xFF0A0E21),
            // textTheme: TextTheme(bodyText2: TextStyle(fontSize: 18,))
        ),
      home: Scaffold(
        appBar: AppBar(title: Text('eSeva'),),
        body: HomePage()
      ),
    );
  }
}
