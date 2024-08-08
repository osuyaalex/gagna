import 'package:flutter/material.dart';
import 'package:gagna/main%20screens/screens/feeds/upcoming_eve_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../network/network.dart';

class UpcomingSeeMore extends StatefulWidget {
  const UpcomingSeeMore({super.key});

  @override
  State<UpcomingSeeMore> createState() => _UpcomingSeeMoreState();
}

class _UpcomingSeeMoreState extends State<UpcomingSeeMore> {
  String? _access;
  List<dynamic>? _upcomingEve;

  Future _getKeys() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    setState(() {
      _access = shared.getString("accessToken");

    });
  }



  Future _getBlogs()async {
    Network().getUpcomingEve(_access!, context).then((v){
      if(v != null){
        setState(() {
          _upcomingEve = v;
        });
      }
    });
  }
  Future _getInfo()async{
    await _getKeys();
    print(_access);
    _getBlogs();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getInfo();
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
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
       // foregroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Upcoming Investments',),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 17
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: _upcomingEve != null?
        StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: _upcomingEve!.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return UpcomingEveDetails(description: _upcomingEve![index]);
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
                            image: _upcomingEve![index].imageUrl== null?
                            DecorationImage(image: AssetImage('assets/Image.jpg'),
                                fit: BoxFit.fill
                            ):DecorationImage(image: NetworkImage(_upcomingEve![index].imageUrl!),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(cutUnwantedPart(_upcomingEve![index].name!),
                          style: TextStyle(
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      Text(cutUnwantedPart(_upcomingEve![index].details!),
                        style: TextStyle(
                            fontSize: 12
                        ),
                      ),
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
