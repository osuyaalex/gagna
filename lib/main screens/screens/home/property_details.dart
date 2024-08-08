import 'package:flutter/material.dart';
import 'package:gagna/main%20screens/screens/feeds/payment_information.dart';
import 'package:gagna/main%20screens/screens/home/widget/description_containers.dart';
import 'package:gagna/network/network.dart';
import 'package:gagna/network/property_description_json.dart';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';
import 'package:intl/intl.dart';
class PropertyDetails extends StatefulWidget {
  final int idNumber;
  const PropertyDetails({super.key, required this.idNumber});

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  final String _niceHouse = 'https://thumbor.forbes.com/thumbor/fit-in/x/https://www.forbes.com/home-improvement/wp-content/uploads/2022/08/kiawah_island-realtor.jpg';
  Detail? _description;
  Future _getPropertyDescription()async{
    Network().propertyDescription(
        widget.idNumber, context).then((v){
          if(v.success == true){
           setState(() {
             _description = v.data?.detail;
           });
          }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPropertyDescription();
  }
  @override
  Widget build(BuildContext context) {
    int sharesSold = _description?.sharesSold ?? 0;
    int totalShares = _description?.totalShares ?? 1;

    double percentage = (sharesSold / totalShares) * 100;
    String formatNumber(String number) {
      var convertedNumber = double.parse(number);
      final formatter = NumberFormat('#,###.##');
      return formatter.format(convertedNumber);
    }
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 50,
        title: Text('Investment View',
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600
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
                      image: NetworkImage(
                          _description?.imageUrl ==null?
                          _niceHouse:
                              _description!.imageUrl!
                      ),
                    fit: BoxFit.fill
                  )
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_description?.name??'',
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
                      child: Text('${percentage.toStringAsFixed(1)}% sold',
                      style: TextStyle(
                        fontSize: 11
                      ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(_description?.projectInformation??'',
                  style: TextStyle(
                    color: Color(0xff595E68),
                    fontSize: 13
                  ),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // Adjust the spacing between items as needed
                runSpacing: 8.0, // Adjust the run spacing as needed
                children: [
                  DescriptionContainers(
                      text: "Starting Share Price",
                      value: Text(
                        '₦${formatNumber(_description?.sharesSold?.toString()??'0')}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff005E5E)
                        ),
                      ),
                  ),
                  DescriptionContainers(
                      text: "Projected Returns",
                      value: Text(_description?.projectedReturn??'',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff005E5E)
                        ),
                      )
                  ),
                  DescriptionContainers(
                      text: "Shares Sold",
                      value: Text('${_description?.sharesSold.toString()??''}%',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff005E5E)
                        ),
                      )
                  ),
                  DescriptionContainers(
                      text: "Projected Payout Date",
                      value: Text(_description?.projectedPayoutDate??'',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff005E5E)
                        ),
                      )
                  ),
                  DescriptionContainers(
                    text: "Starting Share Price",
                    value: Text(
                      '₦${formatNumber(_description?.totalShares?.toString()??'0')}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff005E5E)
                      ),
                    ),
                  ),
                ]
              ),
              SizedBox(height: 18,),
              Text('Investment Details',
                style: TextStyle(
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.85,
                child: Text(_description?.projectDetails??'',
                  style: TextStyle(
                      fontSize: 13,
                    color: Color(0xff595E68)
                  ),
                ),
              ),
              SizedBox(height: 15,),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _description?.amenities?.length??1,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text("* ${_description?.amenities?[index].name??''}",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff595E68)
                              ),
                            ),
                          );
                        }
                    )
                  ],
                ),
              ),
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
