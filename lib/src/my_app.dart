import 'package:flutter/material.dart';

import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  final String title;
  const MyApp({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: title),
    );
  }
}
