import 'package:flutter/material.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';

class PaymentInformation extends StatefulWidget {
  const PaymentInformation({super.key});

  @override
  State<PaymentInformation> createState() => _PaymentInformationState();
}

class _PaymentInformationState extends State<PaymentInformation> {
  TextEditingController _shares = TextEditingController();
  bool _bank = false;
  bool _card = false;
  

  void _onFirstCheckboxChanged(bool? value) {
    setState(() {
      if (value == true) {
        _bank = true;
        _card= false;
      }
    });
  }

  void _onSecondCheckboxChanged(bool? value) {
    setState(() {
      if (value == true) {
        _bank = false;
        _card = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Information'),
        toolbarHeight: MediaQuery.of(context).size.width*0.15,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('A unit share sells today for N10,000',
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
              ),
              SizedBox(height: 30,),
              Text('How many shares are you willing to buy?'),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.12,
                child: TextFormField(

                  controller: _shares,
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
                    hintText: 'Enter amount of shares',
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
                  Text('Amount N0.00',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Text('Payment Method',
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: Colors.grey
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            visualDensity: VisualDensity.compact,
                            activeColor: Color(0xff005E5E),
                            checkColor: Colors.white,
                            value: _bank,
                            onChanged: _onFirstCheckboxChanged,
                            side: const BorderSide(
                                color: Colors.grey
                            ),
                            shape: OvalBorder(),
                          ),
                          SizedBox(width: 7,),
                          Text('Bank Transfer')
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: Colors.grey
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            visualDensity: VisualDensity.compact,
                            activeColor: Color(0xff005E5E),
                            checkColor: Colors.white,
                            value: _card,
                            onChanged: _onSecondCheckboxChanged,
                            side: const BorderSide(
                                color: Colors.grey
                            ),
                            shape: OvalBorder(),
                          ),
                          SizedBox(width: 7,),
                          Text('Card')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 60),
              Button(
                  buttonColor: Color(0xff005E5E),
                  text: 'continue',
                  onPressed: (){},
                  textColor: Colors.white,
                  width: MediaQuery.of(context).size.width,
                minSize: false,
                textOrIndicator: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
