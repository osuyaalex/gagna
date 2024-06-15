import 'package:flutter/material.dart';
import 'package:gagna/main%20screens/screens/profile/widget/number_pad.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SetWithdrawalPin extends StatefulWidget {
  const SetWithdrawalPin({super.key});

  @override
  State<SetWithdrawalPin> createState() => _SetWithdrawalPinState();
}

class _SetWithdrawalPinState extends State<SetWithdrawalPin> {
  TextEditingController _controller = TextEditingController();

  void _onNumberSelected(String number) {
    if (number == 'backspace') {
      if (_controller.text.isNotEmpty) {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      }
    }else if(number == 'face scan'){
      print('face scan');
    } else {
      if (_controller.text.length < 4) { // Assuming 4-digit OTP
        _controller.text += number;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdrawal Pin'),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Set Withdrawal Pin',
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.95,
                child: Text('Create your withdrawal Pin to enable your withdraw when investment is due.'),
              ),
              const SizedBox(
                height: 25,
              ),
              PinCodeTextField(
                controller: _controller,
                length: 4,
                obscureText: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: MediaQuery.of(context).size.width*0.11,
                    activeFillColor: Colors.grey,
                    inactiveColor: Colors.grey,
                  activeBorderWidth: 1,
                  inactiveBorderWidth: 1,
                  fieldOuterPadding: EdgeInsets.symmetric(horizontal: 20),

                ),
                animationDuration: Duration(milliseconds: 300),
                //backgroundColor: Colors.blue.shade50,
                //enableActiveFill: true,
                onChanged: (value) {
                  print(_controller.text);
                },
                appContext: context,
                keyboardType: TextInputType.none, // Disable default keyboard
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.1,),
              NumberPad(onNumberSelected: _onNumberSelected),
              SizedBox(height: 30,),
              //Text(_controller.text)
            ],
          ),
        ),
      ),
    );
  }
}
