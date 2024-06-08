import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gagna/main%20screens/main_home.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  bool _newsLetter = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Center(child: SvgPicture.asset('assets/Vector (2).svg')),
        toolbarHeight: MediaQuery.of(context).size.width*0.3,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.13,),
            SvgPicture.asset('assets/Success tick.svg'),
            SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: const Text('Hurray, You’ve successfully created your account.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23
              ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.17,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    activeColor: Color(0xff005E5E),
                    checkColor: Colors.white,
                    value: _newsLetter,
                    onChanged: (bool? value) {
                      setState(() {
                        _newsLetter = value!;
                      });
                    },
                    side: const BorderSide(
                        width: 0.5,
                        color: Colors.grey
                    )
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Text('Send me updates & newsletter about Gagna products and services'))
              ],
            ),
            SizedBox(height: 30,),
            Button(
                buttonColor: const Color(0xff005E5E),
                text: 'Go to homepage',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return MainHome();
                  }));
                },
                textColor: Colors.white,
                width: MediaQuery.of(context).size.width
            ),
          ],
        ),
      ),
    );
  }
}
