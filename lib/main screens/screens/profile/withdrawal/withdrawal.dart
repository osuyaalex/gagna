import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';


class Withdrawal extends StatefulWidget {
  const Withdrawal({super.key});

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  TextEditingController _email = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _loadingIndicator = false;
  List _jsonBankResult = [];
  List<String>? _bankNames;

  _loadBankJson() async {
    String data = await DefaultAssetBundle.of(context).loadString(
        "assets/json/banks.json"); //for calling local json
    _jsonBankResult = jsonDecode(data);
    setState(() {
      _bankNames = _jsonBankResult.map((bank) => bank['name'] as String).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadBankJson();
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _key,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text('Withdrawal')
          //automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child:  Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text('Input Your Account Number',
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
                  Text('Ensure the account you enter is yours.',
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
                  Text('Account Number'),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.12,
                child: Theme(
                  data: Theme.of(context).copyWith(
                      textSelectionTheme: TextSelectionThemeData(
                          selectionColor: Color(0xff005E5E),
                          selectionHandleColor: Color(0xff005E5E),
                          cursorColor: Color(0xff005E5E)
                      )
                  ),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 16
                    ),
                    cursorColor: Color(0xff005E5E),
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
                      hintText: 'Enter Account Number',
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
              ),
              SizedBox(height: 18,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Bank'),
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
                    hintText: 'Select Bank Name',
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
                  items:_bankNames!=null? _bankNames!.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList():null,
                  onChanged: (String? newValue) {
                    setState(() {

                    });
                  },
                ),
              ),
              SizedBox(height: 18,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Amount'),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.12,
                child: Theme(
                  data: Theme.of(context).copyWith(
                      textSelectionTheme: TextSelectionThemeData(
                          selectionColor: Color(0xff005E5E),
                          selectionHandleColor: Color(0xff005E5E),
                          cursorColor: Color(0xff005E5E)
                      )
                  ),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 16
                    ),
                    cursorColor: Color(0xff005E5E),
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
                      hintText: 'Enter Amount',
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
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('My investment Balance: ₦2,000,000.00 '),
                ],
              ),
              SizedBox(height: 45,),
              Button(
                buttonColor: const Color(0xff005E5E),
                text: 'Withdraw',
                onPressed: (){
                  if (_key.currentState!.validate()) {
                    // setState(() {
                    //   _loadingIndicator = true;
                    // });
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
    );
  }
}
