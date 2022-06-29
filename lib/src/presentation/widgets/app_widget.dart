import 'package:flutter/material.dart';

import '../pages/my_home_page.dart';

class AppWidget extends StatelessWidget {
  final String title;
  const AppWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: title),
    );
  }
}
