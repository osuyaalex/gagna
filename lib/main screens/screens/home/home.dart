import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/svg.dart';
import 'package:gagna/main%20screens/notification.dart';
import 'package:gagna/main%20screens/screens/home/investment_see_more.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _placeHolderUrl = 'https://cdn.vectorstock.com/i/500p/63/42/avatar-photo-placeholder-icon-design-vector-30916342.jpg';
  dynamic _deviceInfo = 0;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

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
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Row(
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
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return NotificationScreen();
              }));
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xff005E5E).withOpacity(0.1),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -1, end: -1),

                //badgeContent: Text('3'),
                child: SvgPicture.asset('assets/notification-bing.svg')
              ),
            ),
          ),
          SizedBox(width: 30,)
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Container(
            width: MediaQuery.of(context).size.width*0.85,
            height: MediaQuery.of(context).size.width*0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff005E5E),
            ),
            child: Stack(
              children: [
                Positioned(
                    right: 1,
                    bottom: 1,
                    child: SvgPicture.asset('assets/Line 96.svg')
                ),
                Positioned(
                    left: 25,
                    top: 1,
                    child: SvgPicture.asset('assets/Ellipse 2053.svg')
                ),
                Positioned(
                  left: 18,
                  top: 24,
                  child: Text('Total Investment',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  bottom: 22,
                  child: Text('N 20,000,000',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white
                    ),
                  ),
                ),
                Positioned(
                    right: 18,
                    bottom: 22,
                    child: Icon(Icons.visibility_off_outlined, color: Color(0xffB5A46D),size: 22,)
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Investment',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return InvestmentSeeMore();
                        }));
                      },
                      child: Text('See All',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          color: Color(0xffB5A46D)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: _deviceInfo >27?
                MediaQuery.of(context).size.height*0.29:MediaQuery.of(context).size.height*0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                    itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.39,
                        //color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width*0.2,
                              width: MediaQuery.of(context).size.width*0.39,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/Image.jpg'),
                                fit: BoxFit.fill
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 1.0),
                                        child: Text('N 10,000',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      Text('Per unit share',
                                      style: TextStyle(
                                        color: Color(0xffB5A46D),
                                        fontSize: 12
                                      ),
                                      )
                                    ],
                                  ),
                                  SvgPicture.asset('assets/Group 289337.svg')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('Sovereign Terrace',
                              style: TextStyle(
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ),
                            Text('3bedroom duplex',
                            style: TextStyle(
                              fontSize: 12
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('Ikeja, Lagos.',
                                style: TextStyle(
                                    fontSize: 12
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:MediaQuery.of(context).size.width*0.117,
                                  child: Divider(
                                    color: Color(0xff005E5E),
                                  ),
                                ),
                                SizedBox(
                                  width:MediaQuery.of(context).size.width*0.273,
                                  child: Divider(),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('22% - 32% ROI',
                                style: TextStyle(
                                  fontSize: 10
                                ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                    }
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Blog Feed',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text('See All',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffB5A46D)
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: _deviceInfo >27?
                              MediaQuery.of(context).size.width*0.28:
                              MediaQuery.of(context).size.width*0.33,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.35,
                                    height: _deviceInfo >27?
                                    MediaQuery.of(context).size.width*0.28:
                                    MediaQuery.of(context).size.width*0.33,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/Image.jpg',),
                                      fit: BoxFit.fill
                                      )
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.45,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('How Much Does Landlord Insurance Cost?',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: _deviceInfo >27?null:13
                                        ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text('Real estate investing can be a great way to earn ongoing income while generating long-term profit too.',
                                          style: TextStyle(
                                              fontSize: _deviceInfo >27?12:11
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
