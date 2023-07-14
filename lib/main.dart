import 'package:chatty/colors.dart';
import 'package:chatty/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatty',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            accentColor: yellowAccentColor, primarySwatch: Colors.orange),
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
