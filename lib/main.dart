import 'package:flutter/material.dart';
import 'package:movies_app/nav_menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Movies App',
      theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.dark(primary: Colors.grey),
          primaryColor: Colors.green
      ),
      home: const NavMenu(),
    );
  }
}

