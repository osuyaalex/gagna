import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gagna/main%20screens/screens/profile/book_marks/bookmark_library.dart';
import 'package:gagna/main%20screens/screens/profile/edit/edit_profile.dart';
import 'package:gagna/main%20screens/screens/profile/security_and_privacy/security_privacy.dart';
import 'package:gagna/main%20screens/screens/profile/verify_id/verify_id.dart';
import 'package:gagna/main%20screens/screens/profile/withdrawal/withdrawal.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    deviceVersion();
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
                  Text('example@gmail.com',
                    style: TextStyle(
                        color: Colors.black,
                      fontSize: 14
                    ),
                  ),
                  Button(
                      buttonColor: Color(0xff005E5E),
                      text: 'Edit Profile',
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return EditProfile();
                        }));
                      },
                      textColor: Colors.white,
                      width: _deviceInfo >27?MediaQuery.of(context).size.width*0.3:MediaQuery.of(context).size.width*0.36,
                    minSize: true,
                    textOrIndicator: false,
                  )
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return VerifyID();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset('assets/Component 9.svg'),
                        ),
                        Text('Verify ID',
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade700,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset('assets/Component 10.svg'),
                      ),
                      Text('Referral',
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade700,)
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return BookmarkLibrary();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset('assets/Component 11.svg'),
                        ),
                        Text('Bookmark Library',
                          style: TextStyle(
                              fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade700,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Withdrawal();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset('assets/Frame 44266.svg'),
                        ),
                        Text('Withdrawal',
                          style: TextStyle(
                              fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade700,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset('assets/Frame 44267.svg'),
                      ),
                      Text('Contact Us',
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade700,)
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SecurityAndPrivacy();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset('assets/Frame 44268.svg'),
                        ),
                        Text('Security & Privacy',
                          style: TextStyle(
                              fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade700,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset('assets/Frame 44269.svg'),
                      ),
                      Text('Log Out',
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
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
