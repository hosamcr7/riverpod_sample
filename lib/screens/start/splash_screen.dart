import 'package:flutter/material.dart';
import 'package:riverpod_sample/screens/login/login_screen.dart';
import 'package:riverpod_sample/services/helper_methods.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void start()async{
    await Future.delayed(Duration(seconds: 3));
    NavigationApp.push(context, LoginScreen());

  }
  @override
  void initState() {
    // start();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FlutterLogo(),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () =>  NavigationApp.push(context, LoginScreen()),),
    );
  }
}
