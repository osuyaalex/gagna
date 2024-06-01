import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class InvestmentSeeMore extends StatefulWidget {
  const InvestmentSeeMore({super.key});

  @override
  State<InvestmentSeeMore> createState() => _InvestmentSeeMoreState();
}

class _InvestmentSeeMoreState extends State<InvestmentSeeMore> {
  TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.width*0.25,
        title: Center(
          child: SizedBox(
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
                    onPressed: (){},
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: 10,
            itemBuilder: (context, index){
              return Container(
                //width: MediaQuery.of(context).size.width*0.39,
                //color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width*0.24,
                      //width: MediaQuery.of(context).size.width*0.39,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/Image.jpg'),
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
                                child: Text('N 10,000',
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
                      child: Text('Sovereign Terrace',
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Text('3bedroom duplex',
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Ikeja, Lagos.',
                        style: TextStyle(
                            fontSize: 12
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width:MediaQuery.of(context).size.width*0.117,
                          child: Divider(
                            color: Color(0xff005E5E),
                          ),
                        ),
                        SizedBox(
                          width:MediaQuery.of(context).size.width*0.273,
                          child: Divider(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('22% - 32% ROI',
                          style: TextStyle(
                              fontSize: 10
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            staggeredTileBuilder:  (context) => const StaggeredTile.fit(1)
        ),
      ),
    );
  }
}
