import 'package:flutter/material.dart';
class BlogDetails extends StatefulWidget {
  final dynamic blogDescription;
  const BlogDetails({super.key, required this.blogDescription});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  final String _niceHouse = 'https://thumbor.forbes.com/thumbor/fit-in/x/https://www.forbes.com/home-improvement/wp-content/uploads/2022/08/kiawah_island-realtor.jpg';



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 50,
        title: Text('Blog Details',
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
                            widget.blogDescription?.imageUrl ==null?
                            _niceHouse:
                            widget.blogDescription!.imageUrl!
                        ),
                        fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.85,
                    child: Text( widget.blogDescription?.title??'',
                      style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 18,),
              Text('Details',
                style: TextStyle(
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.85,
                child: Text( widget.blogDescription.body,
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff595E68)
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
