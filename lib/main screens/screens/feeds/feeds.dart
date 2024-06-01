import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gagna/main%20screens/screens/feeds/investment_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';


class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Active Investment',
            style: TextStyle(
              fontSize: 16
            ),
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return InvestmentView();
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
                    },
                    staggeredTileBuilder:  (context) => const StaggeredTile.fit(1)
                ),
            )
          ],
        ),
      ),
    );
  }
}
