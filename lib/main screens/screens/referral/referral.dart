import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';
import 'package:share_plus/share_plus.dart';
class Referraal extends StatefulWidget {
  const Referraal({super.key});

  @override
  State<Referraal> createState() => _ReferraalState();
}
class _ReferraalState extends State<Referraal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Referral'),
      ) ,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
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
            ),
            SizedBox(height: 20,),
            Image.asset('assets/image 16.png'),
            SizedBox(height: 15,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.75,
              child: Text('Help your friends invest smarter and earn'
                  ' referral bonuses up to 2% commission when they invest with us',
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal:13, vertical: 14),
                  width: MediaQuery.of(context).size.width*0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: Color(0xff005E5E).withOpacity(0.2)
                  ),
                  child: Text('Code',
                  style: TextStyle(
                    color: Color(0xff005E5E),
                    fontWeight: FontWeight.w600
                  ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 3000),
                        backgroundColor: Color(0xff99E3E2),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/checkmark-circle.svg'),
                            SizedBox(width: 35,),
                            Text('code has been copied to your clipboard',
                            style: TextStyle(
                              color: Color(0xff005E5E)
                            ),
                            )
                          ],
                        ),
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height-120,
                            left: 10,
                            right: 10
                        ),
                        // Provide a unique tag for each SnackBar instance
                        // by appending the current timestamp to the title
                        key: ValueKey<String>('title' + DateTime.now().toString()),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal:13, vertical: 14),
                    width: MediaQuery.of(context).size.width*0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Color(0xff005E5E)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('copy',
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: SvgPicture.asset('assets/copy.svg'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            SvgPicture.asset('assets/Frame 1000004880.svg'),
            SizedBox(height: 60,),
            Button(
                buttonColor: Color(0xff005E5E),
                text: 'Share Referral Link',
                onPressed: (){
                  Share.share('check out my website https://example.com');
                },
                textColor: Colors.white,
                width: MediaQuery.of(context).size.width,
                minSize: false,
                textOrIndicator: false
            )
          ],
        ),
        ),
      ),
    );
  }
}
