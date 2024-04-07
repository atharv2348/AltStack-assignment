import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void intializeSharedPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp = [];
    prefs.setStringList("taskList", temp);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intializeSharedPrefrences();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(screenWidth, screenHeight),
      builder: (_, context) {
        return MaterialApp(
          home: HomePage(),
        );
      },
    );
  }
}
