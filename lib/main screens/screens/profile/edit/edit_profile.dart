import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import '../../../../start screen/widgets/elevated_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _placeHolderUrl = 'https://cdn.vectorstock.com/i/500p/63/42/avatar-photo-placeholder-icon-design-vector-30916342.jpg';
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
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width*0.4,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        title:Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        width: 1.5,
                        color: Color(0xff005E5E).withOpacity(0.7)
                    ),
                    image: DecorationImage(
                        image: NetworkImage(_placeHolderUrl)
                    )
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi,',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ),
                  Text('Name',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('First Name',
                    style: TextStyle(
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text('First',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                      color: Color(0xff005E5E)
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Surname',
                    style: TextStyle(
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text('Sur',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff005E5E)
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email',
                    style: TextStyle(
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text('example@gmail.com',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff005E5E)
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phone Number',
                    style: TextStyle(
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text('06060500403',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff005E5E)
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Deactivate Account',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                      color: Colors.red
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade700,)
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
            ],
          ),
        ),
      ),

    );
  }
}
