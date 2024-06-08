import 'package:flutter/material.dart';
import 'package:gagna/main%20screens/screens/profile/set_withdrawal_pin.dart';

class SecurityAndPrivacy extends StatelessWidget {
  const SecurityAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Security & Privacy'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Change Password',
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade700,)
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SetWithdrawalPin();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Set Withdrawal Pin',
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade700,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey.shade200,),
            ],
          ),
        ),
      ),
    );
  }
}
