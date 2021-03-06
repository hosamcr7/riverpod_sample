import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/provider/user_provider.dart';
import 'package:riverpod_sample/screens/login/login_screen.dart';
import 'package:riverpod_sample/screens/posts/posts_screen.dart';
import 'package:riverpod_sample/screens/start/splash_screen.dart';





void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: SplashScreen(),
    );
  }
}


