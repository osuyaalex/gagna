import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  String? _access;
  late VideoPlayerController _controller;

  Future _startScreen() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    setState(() {
      _access = shared.getString("accessToken");
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/animations/gagna.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _startScreen().then((value) {
      Future.delayed(const Duration(seconds: 5), () {
        if (_access != null) {
         context.go('/deeplink/main');
        } else {
          context.go('/deeplink/homepage');
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _controller.value.isInitialized
            ? FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
        )
            : Container(),
      ),
    );
  }
}
