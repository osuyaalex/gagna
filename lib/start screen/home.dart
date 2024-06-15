import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:gagna/start%20screen/login_page.dart';
import 'package:gagna/start%20screen/signup_page.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';
import 'package:gagna/start%20screen/widgets/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  dynamic _deviceInfo = 0;

  deviceVersion()async{
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    final info = androidInfo.version.sdkInt;
    if(mounted){
      setState(() {
        _deviceInfo = info;
        print(_deviceInfo);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deviceVersion();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              padding:_deviceInfo >27? EdgeInsets.only(bottom: MediaQuery.of(context).size.width*0.17):EdgeInsets.only(top: MediaQuery.of(context).size.width*0.05),
              width: MediaQuery.of(context).size.width,
              //color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    buttonColor: const Color(0xff005E5E).withOpacity(0.2),
                    text: "Login",
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const LoginPage();
                      }));
                    },
                    textColor: const Color(0xff005E5E),
                    width: MediaQuery.of(context).size.width*0.3,
                    minSize: false,
                    textOrIndicator: false,
                  ),
                  SizedBox(width: 20,),
                  Button(
                    buttonColor: const Color(0xff005E5E),
                    text: "Create Account",
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const SignUpPage();
                      }));
                    },
                    textColor:  Colors.white,
                    width: MediaQuery.of(context).size.width*0.45,
                    minSize: false,
                    textOrIndicator: false,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
