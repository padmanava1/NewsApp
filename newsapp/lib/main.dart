import 'package:flutter/material.dart';
import 'package:newsapp/news_app/presentation/pages/homepage.dart';

import 'core/theme/news_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: NewsAppTheme.lightTheme,
      //ThemeData(primaryColor: Colors.lightBlueAccent),
      home:  Homepage(),
    );
  }
}

