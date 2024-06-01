import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';

class ForgotPasswordEmailVerification extends StatefulWidget {
  const ForgotPasswordEmailVerification({super.key});

  @override
  State<ForgotPasswordEmailVerification> createState() => _ForgotPasswordEmailVerificationState();
}

class _ForgotPasswordEmailVerificationState extends State<ForgotPasswordEmailVerification> {
  TextEditingController _email = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _key,
      child: Scaffold(
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Enter your email to reset your password',
                    style: TextStyle(
                        fontSize: 15
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Email'),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.12,
                child: TextFormField(

                  controller: _email,
                  validator: (v){
                    if(v!.isEmpty){
                      return 'Field must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                    hintStyle: TextStyle(
                        fontSize: 12.5
                    ),
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide:  BorderSide(
                            color: Colors.grey.shade400
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide:  BorderSide(
                            color: Colors.grey.shade400
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide:  BorderSide(
                            color: Colors.grey.shade400
                        )
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: Colors.grey.shade400
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Button(
                  buttonColor: const Color(0xff005E5E),
                  text: 'Continue',
                  onPressed: (){
                    EasyLoading.show();

                  },
                  textColor: Colors.white,
                  width: MediaQuery.of(context).size.width
              ),

            ],
          ),
        ),
      ),
    );
  }
}
