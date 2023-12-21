import 'package:flutter/material.dart';
import 'package:productlisting/api.dart';
import 'package:productlisting/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiConnection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping',
        theme: ThemeData(),
        home: SplashScreen(),
      ),
    );
  }
}
