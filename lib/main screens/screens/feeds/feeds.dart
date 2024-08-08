import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gagna/main%20screens/screens/feeds/upcoming_eve_details.dart';
import 'package:gagna/main%20screens/screens/feeds/upcoming_seemore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../network/network.dart';
import '../../../network/property_json.dart';
import '../home/investment_see_more.dart';
import '../home/property_details.dart';
import '../progress_bar.dart';


class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<Detail>? _detail;
  String? _access;
  List<dynamic>? _upcomingEve;

  Future _getKeys() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    setState(() {
      _access = shared.getString("accessToken");

    });
  }
  

 
  Future _getBlogs()async {
    Network().getUpcomingEve(_access!, context).then((v){
      if(v != null){
        setState(() {
          _upcomingEve = v;
        });
      }
    });
  }
  Future _getInfo()async{
    await _getKeys();
    print(_access);
    _getBlogs();
  }
  Future _getALlProperties()async{
    Network().getAllProperty(context).then((v){
      if(v.success == true){
        if(mounted){
          setState(() {
            _detail = v.data!.detail!;
          });
        }
      }
    });
  }
  
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getALlProperties();
    _getInfo();
  }
  @override
  Widget build(BuildContext context) {
    String cutUnwantedPart(String name) {
      if (name.length > 15) {
        return name.trim().replaceRange(15, null, '...');
      }
      return name;
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width*0.3,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Text('Investment',)
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xff005E5E).withOpacity(0.1),
            child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -1, end: -1),

                //badgeContent: Text('3'),
                child: SvgPicture.asset('assets/notification-bing.svg')
            ),
          ),
          SizedBox(width: 30,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Active Investment',
                  style: TextStyle(
                    fontSize: 16
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
              SizedBox(
                height: 18,
              ),
              _detail != null?SingleChildScrollView(
                child: Column(
                  children: [
                    StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        itemCount: min(_detail!.length, 4),
                        itemBuilder: (context, index){
                          double progress = 0;
                          int sharesSold = _detail![index].sharesSold ?? 0;
                          int totalShares = _detail![index].totalShares ?? 1;
                          double percentage = (sharesSold / totalShares) * 100;
                          print(percentage);
                          double maxValue = 100.0;
                          double currentValue = percentage;
                          progress = (maxValue > 0) ? (currentValue / maxValue) : 0.0;
                          progress = progress.isFinite ? progress : 0.0;
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return PropertyDetails(idNumber: _detail![index].id!);
                              }));
                            },
                            child: Container(
                              //width: MediaQuery.of(context).size.width*0.39,
                              //color: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.width*0.24,
                                    //width: MediaQuery.of(context).size.width*0.39,
                                    decoration: BoxDecoration(
                                        image: _detail![index].imageUrl== null?
                                        DecorationImage(image: AssetImage('assets/Image.jpg'),
                                            fit: BoxFit.fill
                                        ):DecorationImage(image: NetworkImage(_detail![index].imageUrl!),
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
                                              child: Text('\$ ${_detail![index].pricePerShare}',
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
                                    child: Text(cutUnwantedPart(_detail![index].name!),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Text(cutUnwantedPart(_detail![index].projectDetails!),
                                    style: TextStyle(
                                        fontSize: 12
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(_detail![index].location!,
                                      style: TextStyle(
                                          fontSize: 12
                                      ),
                                    ),
                                  ),
                                  ProgressIndicatorWidget(
                                      currentValue: currentValue,
                                      maxValue: maxValue,
                                      progress: progress),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('${_detail![index].projectedReturn??""} ROI',
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
                        },
                        staggeredTileBuilder:  (context) => const StaggeredTile.fit(1)
                    ),
                  ],
                ),
              ):Center(
                child: CircularProgressIndicator(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Upcoming Investment',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return UpcomingSeeMore();
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
              SizedBox(
                height: 18,
              ),
              _upcomingEve != null?SingleChildScrollView(
                child: Column(
                  children: [
                    StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        itemCount: min(_upcomingEve!.length, 4),
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return UpcomingEveDetails(description: _upcomingEve![index]);
                              }));
                            },
                            child: Container(
                              //width: MediaQuery.of(context).size.width*0.39,
                              //color: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.width*0.24,
                                    //width: MediaQuery.of(context).size.width*0.39,
                                    decoration: BoxDecoration(
                                        image: _upcomingEve![index].imageUrl== null?
                                        DecorationImage(image: AssetImage('assets/Image.jpg'),
                                            fit: BoxFit.fill
                                        ):DecorationImage(image: NetworkImage(_upcomingEve![index].imageUrl!),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(cutUnwantedPart(_upcomingEve![index].name!),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Text(cutUnwantedPart(_upcomingEve![index].details!),
                                    style: TextStyle(
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder:  (context) => const StaggeredTile.fit(1)
                    ),
                  ],
                ),
              ):Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
