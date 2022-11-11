import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news_app/presentation/cubit/homepage_cubit.dart';
import 'package:newsapp/news_app/presentation/pages/homepage.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;
import 'core/theme/news_app_theme.dart';


void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomepageCubit>(),
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: NewsAppTheme.lightTheme,
        //ThemeData(primaryColor: Colors.lightBlueAccent),
        home: Homepage(),
      ),
    );
  }
}

