import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gagna/main%20screens/screens/portfolio/investment.dart';
import 'package:gagna/main%20screens/screens/portfolio/statistics.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}
enum Segment { investment, statistics }
class _PortfolioScreenState extends State<PortfolioScreen>with SingleTickerProviderStateMixin {
  Segment _segment = Segment.investment;
  late AnimationController _animationController;
  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  void _switchToSegment(Segment segment) {
    if (_segment == segment) return;

    setState(() {
      _segment = segment;
    });

    if (_segment == Segment.statistics) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    data = [
      ChartData('CHN', 12),
      ChartData('GER', 15),
      ChartData('RUS', 30),
      ChartData('BRZ', 6.4),
      ChartData('IND', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
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
        title: Text("Portfolio",
        style: TextStyle(
          color: Colors.black
        ),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: _segment == Segment.investment?SizedBox(
            height: MediaQuery.of(context).size.width*0.28,
            width: MediaQuery.of(context).size.width*0.85,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.85,
                    height: MediaQuery.of(context).size.width*0.28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xff005E5E),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 18,
                          top: 15,
                          child: Text('Total Portfolio Value',
                            style: TextStyle(
                                color: Color(0xff005E5E),
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Positioned(
                          left: 18,
                          top: 37,
                          child: Text('N 20,000,000',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.grey.shade500
                            ),
                          ),
                        ),
                        Positioned(
                          left: 18,
                          bottom: 6,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 3.0),
                                child: Text('Last 7 days',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      color: Color(0xff005E5E)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(Icons.arrow_upward, size: 17,color: Color(0xff005E5E),),
                              ),
                              Text('0.20%',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xff005E5E)
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            right: 18,
                            bottom: 40,
                            child: Icon(Icons.visibility_off_outlined, color: Color(0xffB5A46D),size: 22,)
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
          ):Container(
            width: MediaQuery.of(context).size.width*0.85,
            height: MediaQuery.of(context).size.width*0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff005E5E),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 18,
                  top: 15,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: Text('Total Portfolio Value',
                          style: TextStyle(
                              color: Colors.white,
                          ),
                        ),
                      ),
                      Text('N 20,000,000',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 18,
                  top: 38,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text('Number of Investment',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Text('3',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 18,
                  bottom: 7,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text('Total Portfolio Value',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Text('N 1,000,000',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 18,
                    bottom: 40,
                    child: Icon(Icons.visibility_off_outlined, color: Color(0xffB5A46D),size: 22,)
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width*0.1,),
            CustomSlidingSegmentedControl(
              isStretch: true,
              initialValue: _segment.index,
              children:  {
                Segment.investment.index: SizedBox(
                  child: _segment == Segment.investment?
                  Text(
                    'Investment',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                    ),
                  ): Text(
                    'Investment',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )
                ),
                Segment.statistics.index: SizedBox(
                  child: _segment == Segment.statistics?
                  Text(
                    'Statistics',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ):Text(
                    'Statistics',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )
                ),

              },
              decoration: BoxDecoration(
                  color: Color(0xff005E5E).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8)
              ),
              thumbDecoration: BoxDecoration(
                  color: const Color(0xff005E5E),
                  borderRadius: BorderRadius.circular(8)
              ),
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInToLinear,
              onValueChanged: (value) {
                setState(() {
                  _switchToSegment(Segment.values[value]);
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: _segment == Segment.investment?Text('Current Investments',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17
              ),
              ):Text('0.3% Inflow Today',
                style: TextStyle(
                  fontSize: 12
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
                    width: double.infinity,
                    child:Stack(
                      children: [
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1.1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: Statistics(data: data,tooltip: _tooltip,)
                        ),
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset.zero,
                            end: Offset(-1.1, 0),
                          ).animate(_animationController),
                          child: PortfolioInvestment(),
                        ),

                      ],
                    )
                )
            ),
            _segment == Segment.statistics?
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5.0),
                 child: Text('Your portofolio performance between Feb 16,2024 and Jun 12,2024.',
                 style: TextStyle(
                   color: Colors.grey,
                   fontSize: 14
                 ),
                 ),
               ):
                Container()
          ],
        ),
      ),
    );
  }
}
