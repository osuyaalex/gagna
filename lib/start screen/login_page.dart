import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gagna/main%20screens/main_home.dart';
import 'package:gagna/network/network.dart';
import 'package:gagna/start%20screen/forgot_password_email_verification.dart';
import 'package:gagna/start%20screen/signup_page.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';
import 'package:gagna/utilities/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _loadingIndicator = false;
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
          child:  SingleChildScrollView(
            child: Column(
              children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Welcome Back to Gagna!',
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
                          Text('Kindly fill in your details to Login',
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
                      errorStyle: const TextStyle(fontSize: 0.01),
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
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Password'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.12,
                  child: TextFormField(
                    controller: _password,
                    obscureText: _obscureText,
                    validator: (v){
                      if(v!.isEmpty){
                        return 'Field must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.01),
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: _obscureText? Icon(Icons.visibility_outlined, color: Colors.grey.shade400,):Icon(Icons.visibility_off_outlined,color: Colors.grey.shade400,)
                      ),

                      hintStyle: TextStyle(
                          fontSize: 12.5
                      ),
                      hintText: 'Enter Password',
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ForgotPasswordEmailVerification();
                          }));
                        },
                        child: const Text('Forgot Password?',
                        style: TextStyle(
                          color: Colors.black
                        ),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

                Button(
                    buttonColor: const Color(0xff005E5E),
                    text: 'Login',
                    onPressed: (){
                      if(_key.currentState!.validate()){
                        setState(() {
                          _loadingIndicator = true;
                        });
                        Network().login(
                            _email.text,
                            _password.text, context).then((value)async{
                              if(value.success!){
                                SharedPreferences shared = await SharedPreferences.getInstance();
                                EasyLoading.dismiss();
                                await shared.setString('accessToken', value.data!.detail!.access!);
                                await  shared.setString('refreshToken', value.data!.detail!.refresh!);

                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return MainHome();
                                }));
                              }else if(value.success! == false){
                                setState(() {
                                  _loadingIndicator = false;
                                });
                                snack(context, value.error!.message!.detail!);
                              }
                        });
                      }else{
                        snack(context, 'Fields are empty');
                      }
                    },
                    textColor: Colors.white,
                    width: MediaQuery.of(context).size.width,
                  minSize: false,
                  textOrIndicator: _loadingIndicator,
                ),
                SizedBox(height: 25,),
                RichText(
                    text: TextSpan(
                        text: 'New to Gagna? ',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Create an account',
                              style: const TextStyle(
                                color: Color(0xffE8D28B),
                                //decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return SignUpPage();
                                  }));
                                }
                          )
                        ]
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
