import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gagna/main%20screens/main_home.dart';
import 'package:gagna/start%20screen/home.dart';
import 'package:gagna/start%20screen/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
  _easyLoading();
}
_easyLoading(){
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 30.0
    ..radius = 50.0
    ..progressColor = Color(0xff7F78D8)
    ..backgroundColor = Colors.transparent
    ..textColor = Colors.cyan
    ..indicatorColor = Color(0xff005E5E)
    ..userInteractions = true
    ..boxShadow = <BoxShadow>[]
    ..dismissOnTap = false;

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        //  systemNavigationBarColor: Colors.transparent,
      ),
    );
    final router = GoRouter(
      initialLocation:'/' ,
      routes: [
        GoRoute(
            path: '/',
            builder: (_, __) => SplashScreen()
        ),
        GoRoute(
            path: '/deeplink/main',
            builder: (_, __) => MainHome()
        ),
        GoRoute(
            path: '/deeplink/homepage',
            builder: (_, __) => HomePage()
        ),
      ],
    );
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff005E5E)),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
    );
  }
}

