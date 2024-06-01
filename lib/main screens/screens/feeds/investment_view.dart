import 'package:flutter/material.dart';
import 'package:gagna/main%20screens/screens/feeds/payment_information.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';
class InvestmentView extends StatefulWidget {
  const InvestmentView({super.key});

  @override
  State<InvestmentView> createState() => _InvestmentViewState();
}

class _InvestmentViewState extends State<InvestmentView> {
  final String _niceHouse = 'https://thumbor.forbes.com/thumbor/fit-in/x/https://www.forbes.com/home-improvement/wp-content/uploads/2022/08/kiawah_island-realtor.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Investment View',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600
          ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.width*0.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(_niceHouse),
                    fit: BoxFit.fill
                  )
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sovereign Terrace',
                    style: TextStyle(
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xffFFF8DF),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text('shares sold out 68%',
                      style: TextStyle(
                        fontSize: 11
                      ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text('N10,000/share',
                style: TextStyle(
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.85,
                child: Text('14 unit high yield 3bedroom apartment in Lekki Lagos',
                  style: TextStyle(
                      fontSize: 13
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text('Investment Details',
                style: TextStyle(
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 15,),
              Text('data'),
              SizedBox(height: 30,),
              Text('Project Information',
                style: TextStyle(
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 15,),
              Text('data'),
              SizedBox(height: 30,),
              Button(
                  buttonColor: Color(0xff005E5E),
                  text: 'Buy Share',
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return PaymentInformation();
                    }));
                  },
                  textColor: Colors.white,
                  width: MediaQuery.of(context).size.width
              )
            ],
          ),
        ),
      ),
    );
  }
}
