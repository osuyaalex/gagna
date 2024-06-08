import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gagna/start%20screen/password_page.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';
import 'package:gagna/utilities/shot_snackbar.dart';
import 'package:intl/intl.dart';
import 'package:phone_form_field/phone_form_field.dart';

class InformationPage extends StatefulWidget {
  final String email;
  final String otp;
  const InformationPage({super.key, required this.email, required this.otp});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  PhoneNumber? phone;
  TextEditingController _dob = TextEditingController();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  String? _gender;
  bool _privacy = false;
  GlobalKey<FormState> _key = GlobalKey<FormState>();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dob.text = _dateFormat.format(picked);
      });
    }
  }
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
                      child: Text('Create An Account',
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
                    Text('Let\'s get you started',
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
                    Text('First Name'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.12,
                  child: TextFormField(

                    controller: _firstName,
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
                      hintText: 'Enter First Name',
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
                    Text('Last Name'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.12,
                  child: TextFormField(
                    controller: _lastName,
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
                      hintText: 'Enter Last Name',
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
                    Text('Phone Number'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.12,
                  child: PhoneFormField(
                    key: const Key('phone-field'),
                    controller: null,
                    initialValue: null,
                    shouldFormat: true,
                    defaultCountry: IsoCode.NG,
                    decoration:  InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.01),
                      contentPadding: EdgeInsets.only(top: 5),
                      hintStyle: TextStyle(
                          fontSize: 12.5
                      ),
                      hintText: "Enter Phone Number",
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
                    validator: PhoneValidator.required(),
                    isCountryChipPersistent: true,
                    isCountrySelectionEnabled: true,
                    countrySelectorNavigator: const CountrySelectorNavigator.bottomSheet(),
                    showFlagInInput: true,
                    flagSize: 16,
                    autofillHints: const [AutofillHints.telephoneNumber],
                    enabled: true,
                    autofocus: false,

                    onChanged: (PhoneNumber? p)async{
                      setState(() {
                        phone = p;
                      });
                    },
                    // ... + other textfield params
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Date Of Birth'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.12,
                  child: TextFormField(
                    controller: _dob,
                    keyboardType: TextInputType.phone,
                    validator: (v){
                      if(v!.isEmpty){
                        return 'Field must not be empty';
                      }
                      return null;
                    },
                    onTap: (){
                      _selectDate(context);
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.01),
                      hintStyle: TextStyle(
                          fontSize: 12.5
                      ),
                      hintText: 'DD/MM/YYYY',
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
                    Text('Gender'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.12,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.01),
                      contentPadding:const EdgeInsets.only(top: 5, left: 10),
                      hintStyle: const TextStyle(
                          fontSize: 12.5
                      ),
                      hintText: 'select Gender',
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
                    items: ["Male", "Female", "Other"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        if(newValue== "Male"){
                          _gender = "M";
                        }else if(newValue== "Female"){
                          _gender = "F";
                        }else if(newValue== "Other"){
                          _gender = "O";
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 23,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Checkbox(
                        activeColor: Color(0xff005E5E),
                        checkColor: Colors.white,
                        value: _privacy,
                          onChanged: (bool? value) {
                            setState(() {
                              _privacy = value!;
                            });
                          },
                        side: const BorderSide(
                          width: 0.5,
                            color: Colors.grey
                        )
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: RichText(
                            text: TextSpan(
                                text: 'By continuing, you agree to our ',
                                style: const TextStyle(
                                  height: 1.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Terms of Service ',
                                      style: const TextStyle(
                                        color: Color(0xffE8D28B),
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){}
                                  ),
                                  const TextSpan(
                                      text: 'and ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                  ),
                                  TextSpan(
                                      text: 'Privacy Policy ',
                                      style: const TextStyle(
                                        color: Color(0xffE8D28B),
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){}
                                  ),
                                ]
                            ),

                        )
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width*0.21,),
                Button(
                    buttonColor: const Color(0xff005E5E),
                    text: 'Continue',
                    onPressed: (){
                      if(_key.currentState!.validate()){
                        if(_gender != null){
                          if(_privacy == true){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return  PasswordPage(
                                email: widget.email,
                                otp: widget.otp,
                                lastName: _lastName.text,
                                firstName: _firstName.text,
                                gender: _gender!,
                                phoneNumber: phone!.international,
                              );
                            }));
                          }else{
                            shortSnack(context, "Agree to the privacy policy");
                          }
                        }else{
                          shortSnack(context, "Select a gender");
                        }

                      }
                    },
                    textColor: Colors.white,
                    width: MediaQuery.of(context).size.width
                ),
                SizedBox(height: 25,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
