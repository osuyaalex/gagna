import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gagna/network/network.dart';
import 'package:gagna/start%20screen/info_page.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';
import 'package:gagna/utilities/shot_snackbar.dart';

import '../network/success_error.dart';


class VerificationPage extends StatefulWidget {
  final String email;
  const VerificationPage({super.key, required this.email});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  int _start = 600;
  Timer? _timer;
  String? _otp;
  bool _loadingIndicator = false;
  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if(mounted){
          if (_start == 1) {

          }else {
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }
  void restartTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _start = 600;
    });
    _startTimer();

  }
  String _formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Center(child: SvgPicture.asset('assets/Vector (2).svg')),
        toolbarHeight: MediaQuery.of(context).size.width*0.3,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child:  Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text('Email Verification',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width:  MediaQuery.of(context).size.width*0.8,
                  child: RichText(
                      text: TextSpan(
                          text: 'We’ve sent an OTP to your email ${widget.email} ',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 14
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Change',
                                style: const TextStyle(
                                  color: Color(0xff005E5E),
                                  //decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){}
                            )
                          ]
                      )
                  )
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: Color(0xff005E5E),
              focusedBorderColor: Color(0xff005E5E),
              fieldHeight: MediaQuery.of(context).size.width*0.13,
              borderRadius: BorderRadius.circular(10),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {},
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                setState(() {
                  _otp = verificationCode;
                });
              }, // end onSubmit
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 TextButton(
                     onPressed: restartTimer,
                     child: _start != 1?
                     Text('Expires ${_formatDuration(_start)}',
                       style: const TextStyle(
                           color: Color(0xffE8D28B),
                           fontWeight: FontWeight.w300,
                           fontSize: 14
                       ),
                     ):const Text('Resend',
                       style: TextStyle(
                           color:Color(0xffE8D28B),
                           fontWeight: FontWeight.w300,
                           fontSize: 14
                       ),
                     ),
                 )
               ],
             ),
            SizedBox(height: 30,),
            Button(
                buttonColor: const Color(0xff005E5E),
                text: 'Continue',
                onPressed: (){
                  EasyLoading.show();
                  if(_otp != null){
                    setState(() {
                      _loadingIndicator = true;
                    });
                    Network().verification_otp(widget.email, _otp!, context).then((value){
                      if (value.success!) {
                        EasyLoading.dismiss();
                        shortSnack(context, value.data!.detail);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return InformationPage(email: widget.email, otp: _otp!);
                        }));
                      } else {
                        setState(() {
                          _loadingIndicator = false;
                        });
                        var errorDetail = value.error!.message!.detail;
                        if (errorDetail is String) {
                          shortSnack(context, errorDetail);
                        } else if (errorDetail is Detail && errorDetail.email != null && errorDetail.email!.isNotEmpty) {
                          shortSnack(context, errorDetail.email!.join(", "));
                        } else {
                          shortSnack(context, "An unknown error occurred.");
                        }
                      }
                    });
                  }
                },
                textColor: Colors.white,
                width: MediaQuery.of(context).size.width,
              minSize: false,
              textOrIndicator: _loadingIndicator,
            ),
            Text(widget.email,style: TextStyle(color: Colors.black),),
            Text(_otp??'')
          ],
        ),
      ),
    );
  }
}
