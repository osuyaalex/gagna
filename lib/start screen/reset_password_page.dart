import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gagna/network/network.dart';
import 'package:gagna/start%20screen/login_page.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';
import 'package:gagna/utilities/shot_snackbar.dart';
import 'package:gagna/utilities/snackbar.dart';

class ResetPasswordPage extends StatefulWidget {
  final String otp;
  final String token;

  const ResetPasswordPage({super.key, required this.otp, required this.token,});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController _comfirmPassword = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureComfirmText = true;
  bool hasUpperCaseAndLowerCase = false;
  bool hasNumber = false;
  bool containsSixChar = false;
  bool _loadingIndicator = false;
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
                      child: Text('Create New Password',
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
                    Text('Let\'s set up your new password',
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
                    Text('Password'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.12,
                  child: TextFormField(
                    controller: _password,
                    validator: (v){
                      if(v!.isEmpty){
                        return 'Field must not be empty';
                      }
                      return null;
                    },
                    obscureText: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        hasUpperCaseAndLowerCase = value.contains(RegExp(r'[a-z]')) &&
                            value.contains(RegExp(r'[A-Z]'));
                        hasNumber = value.contains(RegExp(r'[0-9]'));
                        if(value.length >6){
                          containsSixChar = true;
                        }else{
                          containsSixChar = false;
                        }
                      });
                    },
                    decoration: InputDecoration(
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
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Confirm Password'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.12,
                  child: TextFormField(
                    controller: _comfirmPassword,
                    validator: (v){
                      if(v!.isEmpty){
                        return 'Field must not be empty';
                      }
                      return null;
                    },
                    obscureText: _obscureComfirmText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _obscureComfirmText = !_obscureComfirmText;
                            });
                          },
                          icon: _obscureComfirmText? Icon(Icons.visibility_outlined, color: Colors.grey.shade400,):Icon(Icons.visibility_off_outlined,color: Colors.grey.shade400,)
                      ),

                      hintStyle: TextStyle(
                          fontSize: 12.5
                      ),
                      hintText: 'Confirm Password',
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
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      visualDensity: VisualDensity.compact,
                      activeColor: Color(0xff005E5E),
                      checkColor: Colors.white,
                      value: hasUpperCaseAndLowerCase,
                      onChanged: (bool? value) {},
                      side: const BorderSide(
                          color: Colors.grey
                      ),
                      shape: OvalBorder(),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.65,
                      child: Text('Contains both lower (a-z) and upper case letters(A-Z)',
                        style: TextStyle(
                            fontSize: 12
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      visualDensity: VisualDensity.compact,
                      activeColor: Color(0xff005E5E),
                      checkColor: Colors.white,
                      value: containsSixChar,
                      onChanged: (bool? value) {},
                      side: const BorderSide(
                          color: Colors.grey
                      ),
                      shape: OvalBorder(),
                    ),

                    const Text('Contains at least 6+ letters',
                      style: TextStyle(
                          fontSize: 12
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      visualDensity: VisualDensity.compact,
                      activeColor: Color(0xff005E5E),
                      checkColor: Colors.white,
                      value: hasNumber,
                      onChanged: (bool? value) {},
                      side: const BorderSide(
                          color: Colors.grey
                      ),
                      shape: OvalBorder(),
                    ),

                    const Text('Contains at least 1 number',
                      style: TextStyle(
                          fontSize: 12
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30,),

                Button(
                  buttonColor: const Color(0xff005E5E),
                  text: 'Continue',
                  onPressed: (){
                    if(_password.text == _comfirmPassword.text){
                      if(hasNumber && hasUpperCaseAndLowerCase && containsSixChar){
                        setState(() {
                          _loadingIndicator = true;
                        });
                        Network().resetPassword(
                            widget.token,
                            widget.otp,
                            _password.text,
                            _comfirmPassword.text, context).then((value){
                          if(value.message != null){
                            setState(() {
                              _loadingIndicator = false;
                            });
                            snack(context, value.message!);
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return LoginPage();
                            }));
                          }else if(value.message == null){
                            setState(() {
                              _loadingIndicator = false;
                            });
                            snack(context, value.error!);
                          }
                        });
                      }else{
                        shortSnack(context, "Password conditions have not been met");
                      }
                    }else{
                      shortSnack(context, "The passwords do not match. Check and try again");
                    }
                  },
                  textColor: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  minSize: false,
                  textOrIndicator: _loadingIndicator,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
