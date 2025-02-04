import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HorizontalShimmerScreen extends StatelessWidget {
  const HorizontalShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: SizedBox(
            height: MediaQuery.of(context).size.height*0.35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.39,
                      //color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width*0.2,
                            width: MediaQuery.of(context).size.width*0.39,
                            color: Colors.white,
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
                                    Container(
                                      height: 15,
                                      width: MediaQuery.of(context).size.width*0.3,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        height: 7,
                                        width: MediaQuery.of(context).size.width*0.26,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width*0.3,
                            color: Colors.white,
                          )

                        ],
                      ),
                    ),
                  );
                }
            )),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}

class NewsFeedShimmer extends StatelessWidget {
  const NewsFeedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: SizedBox(
          height: MediaQuery.of(context).size.height*0.35,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width*0.30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.35,
                                height: MediaQuery.of(context).size.width*0.30,
                                color: Colors.white,
                              ),
                              SizedBox(width: 15,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width*0.42,
                                      height: MediaQuery.of(context).size.width*0.23,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.42,
                                      height: 12,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
          )),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}


class GridShimmerScreen extends StatelessWidget {
  const GridShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: SizedBox(
          height: MediaQuery.of(context).size.height*0.35,
          child:  StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 12,
              itemCount: 6,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.39,
                    //color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width*0.2,
                          width: MediaQuery.of(context).size.width*0.39,
                          color: Colors.white,
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
                                  Container(
                                    height: 15,
                                    width: MediaQuery.of(context).size.width*0.3,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      height: 7,
                                      width: MediaQuery.of(context).size.width*0.26,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width*0.3,
                          color: Colors.white,
                        )

                      ],
                    ),
                  ),
                );
              }, staggeredTileBuilder:  (context) => const StaggeredTile.fit(1),
          )),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}
