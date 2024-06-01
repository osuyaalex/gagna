import 'package:flutter/material.dart';
import 'package:gagna/main%20screens/main_home.dart';
import 'package:gagna/start%20screen/home.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  String? _access;

  Future _startScreen()async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    setState(() {
      _access = shared.getString("accessToken");
    });
  }
  @override
  void initState() {
    super.initState();
    _startScreen().then((value){
      if(_access != null){
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainHome()));
        });
      }else{
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Lottie.asset(
              'assets/gagna.json',
            ),
          ),
        ),
      ),
    );
  }
}
