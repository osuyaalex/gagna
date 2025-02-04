import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key,});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _activeIndex = 0;
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
    List<Widget> titles =[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/unsplash_4ojhpgKpS68-min (1).png',),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          children: [
            SizedBox(
              height: _deviceInfo > 27?MediaQuery.of(context).size.height*0.55:
              MediaQuery.of(context).size.height*0.45,
            ),
            SizedBox(height: 25,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: const Text('Unlock The Power 0f Real Estate Investing',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: const Text('Explore Gagna,'
                  ' the platform that lets you invest in real estate without'
                  ' the trouble of buying one yourself.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.5
                ),
              ),
            )
          ],
        ),
      ),
     Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       decoration: BoxDecoration(
         image: DecorationImage(
             image: AssetImage('assets/unsplash_tf2WLWYFtyg-min-1.png'),
           fit: BoxFit.fill
         )
       ),
        child: Column(
          children: [
            SizedBox(
              height: _deviceInfo > 27?MediaQuery.of(context).size.height*0.55:
              MediaQuery.of(context).size.height*0.45,
            ),
            SizedBox(height: 25,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: const Text('Building Wealth, One Share At A Time',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child:  const Text('Spread your investment, earn high returns and'
                  ' easily buy ,sell and manage shares in trusted real estate.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.5
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/unsplash_hDJT_ERrB-w-min.png'),
          fit: BoxFit.fill
          )
        ),
        child: Column(
          children: [
            SizedBox(
              height: _deviceInfo > 27?MediaQuery.of(context).size.height*0.55:
              MediaQuery.of(context).size.height*0.45,
            ),
            SizedBox(height: 25,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: const Text('Invest More, Grow Richer',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child:  const Text('Take Charge of your financial future! Start '
                  'building wealth today by investing any amount you '
                  'want in secure real estate.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.5
                ),
              ),
            )
          ],
        ),
      ),
    ];
    Widget buildIndicator(){
      return AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        count: titles.length,
        effect:  WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: const Color(0xff005E5E),
          dotColor: const Color(0xff005E5E).withOpacity(0.2)
        ),
      );
    }
    return  Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 16/9,
              height: MediaQuery.of(context).size.height,
              autoPlay: true,
              initialPage: 0,
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              onPageChanged: (index, reason){
                setState(() {
                  _activeIndex = index;
                });
              }
          ),
          itemCount: titles.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return titles[index];
          },
        ),
        Positioned(
          bottom:_deviceInfo > 27?
          MediaQuery.of(context).size.width*0.35:MediaQuery.of(context).size.width*0.23,
            left: 25,
            child: buildIndicator()
        )
      ],
    );
  }
}
