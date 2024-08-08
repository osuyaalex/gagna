import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gagna/main%20screens/screens/home/property_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../network/network.dart';
import '../../../network/property_json.dart';
import '../progress_bar.dart';

class InvestmentSeeMore extends StatefulWidget {
  const InvestmentSeeMore({super.key});

  @override
  State<InvestmentSeeMore> createState() => _InvestmentSeeMoreState();
}

class _InvestmentSeeMoreState extends State<InvestmentSeeMore> {
  TextEditingController _search = TextEditingController();
  List<Detail>? _detail;

  Future _getALlProperties()async{
    Network().getAllProperty(context).then((v){
      if(v.success == true){
        setState(() {
          _detail = v.data!.detail!;
        });
      }
    });
  }

  Future _searchProperty()async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    print('fgfgffgsdgdq${shared.getString("accessToken")}');
    if(_search.text.isNotEmpty){
      EasyLoading.show();
      Network().searchProperty(_search.text, context).then((v){
        if(v.success == true){
          EasyLoading.dismiss();
          setState(() {
            _detail = v.data!.detail!;
          });
        }
      });
    }else{
      _getALlProperties();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getALlProperties();
  }
  @override
  Widget build(BuildContext context) {
    String cutUnwantedPart(String name) {
      if (name.length > 15) {
        return name.trim().replaceRange(15, null, '...');
      }
      return name;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.width*0.25,
        title: Center(
          child: Column(
            children: [
              Text('Investments',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700
              ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.12,
                child: TextFormField(

                  controller: _search,
                  validator: (v){
                    if(v!.isEmpty){
                      return 'Field must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: _searchProperty,
                        icon: SvgPicture.asset('assets/search-normal.svg')
                    ),
                    hintStyle: TextStyle(
                        fontSize: 12.5
                    ),
                    hintText: 'Search by location',
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
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: _detail != null?
        StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: _detail!.length,
            itemBuilder: (context, index){
              double progress = 0;
              int sharesSold = _detail![index].sharesSold ?? 0;
              int totalShares = _detail![index].totalShares ?? 1;
              double percentage = (sharesSold / totalShares) * 100;
              print(percentage);
              double maxValue = 100.0;
              double currentValue = percentage;
              progress = (maxValue > 0) ? (currentValue / maxValue) : 0.0;
              progress = progress.isFinite ? progress : 0.0;
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PropertyDetails(idNumber: _detail![index].id!);
                  }));
                },
                child: Container(
                  //width: MediaQuery.of(context).size.width*0.39,
                  //color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width*0.24,
                        //width: MediaQuery.of(context).size.width*0.39,
                        decoration: BoxDecoration(
                            image: _detail![index].imageUrl== null?
                            DecorationImage(image: AssetImage('assets/Image.jpg'),
                                fit: BoxFit.fill
                            ):DecorationImage(image: NetworkImage(_detail![index].imageUrl!),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1.0),
                                  child: Text('\$ ${_detail![index].pricePerShare}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text('Per unit share',
                                  style: TextStyle(
                                      color: Color(0xffB5A46D),
                                      fontSize: 12
                                  ),
                                )
                              ],
                            ),
                            SvgPicture.asset('assets/Group 289337.svg')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(cutUnwantedPart(_detail![index].name!),
                          style: TextStyle(
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      Text(cutUnwantedPart(_detail![index].projectDetails!),
                        style: TextStyle(
                            fontSize: 12
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(_detail![index].location!,
                          style: TextStyle(
                              fontSize: 12
                          ),
                        ),
                      ),
                      ProgressIndicatorWidget(
                          currentValue: currentValue,
                          maxValue: maxValue,
                          progress: progress),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('${_detail![index].projectedReturn??""} ROI',
                            style: TextStyle(
                                fontSize: 10
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            staggeredTileBuilder:  (context) => const StaggeredTile.fit(1)
        ):Container(),
      ),
    );
  }
}
