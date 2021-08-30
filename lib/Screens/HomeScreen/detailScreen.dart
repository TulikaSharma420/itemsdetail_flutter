import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itemsdetail_flutter/constants.dart';
class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({Key? key, this.launchPastDetail}) : super(key: key);
final launchPastDetail;

  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackground,
       appBar: AppBar(
        
        title: Center(
            child: Text('Launch Detail',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
            color: tBackgroundColor,),),
        ),
        leading: IconButton(
          onPressed: (){Get.back();
          },
           icon: Icon(Icons.navigate_before,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           CarouselSlider.builder(
                   itemCount: (widget.launchPastDetail['links']['flickr_images'] as List<dynamic>).length,
                   options: CarouselOptions(
                     height: 300,
                     aspectRatio: 16 / 6,
                     viewportFraction: 1,
                     initialPage: 0,
                     enableInfiniteScroll: true,
                     reverse: false,
                     autoPlay: true,
                     autoPlayInterval: Duration(seconds: 3),
                     autoPlayAnimationDuration: Duration(milliseconds: 800),
                     autoPlayCurve: Curves.fastOutSlowIn,
                     enlargeCenterPage: false,
                     // onPageChanged: callbackFunction,
                     scrollDirection: Axis.horizontal,
                   ),
                   itemBuilder: (context, index, realIdx) {
                    //  print(widget.homeStoredetail['links']['flickr_images']);
                     return Padding(
              padding: EdgeInsets.only(
              left: tDefaultPadding,
              right: tDefaultPadding),
              child: Container(
                margin: EdgeInsets.all(10),
                    child: CachedNetworkImage(
                     imageUrl: ((widget.launchPastDetail['links']['flickr_images'] as List<dynamic>).length > 0 ? widget.launchPastDetail['links']['flickr_images'][index] : 'https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png'),
                     errorWidget: (context, url, error) => Icon(Icons.error),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                     
                      ),
                    ),
                    )
                     );
                   },
                 ),
                 SizedBox(height: tDefaultPadding),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: tDefaultPadding),
                   child: Container(
                     height: MediaQuery.of(context).size.height/4.5,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.white,
                         boxShadow: [
                          BoxShadow(
                          color: Color(0x29000000),
                           offset: Offset(0, 3),
                             blurRadius: 6,
                             ),
                                ],
                     ),
                     child: Column(
                       children: [
                          SizedBox(height: tDefaultPadding,),
                         Row(
                           
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Text('Mission Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                             Text((widget.launchPastDetail['mission_name']!=null?widget.launchPastDetail['mission_name']:"Mission Name Not Found")
                             )
                           ],
                         ),
      
                         SizedBox(height: tDefaultPadding,),
                         Padding(
                           padding: EdgeInsets.only(right: 70),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Text('Launch Site Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                               Text((widget.launchPastDetail['launch_site']['site_name']!=null?widget.launchPastDetail['launch_site']['site_name']:'Launch not found'))
                             ],
                           ),
                         ),
      
                          SizedBox(height: tDefaultPadding,),
                         Padding(
                           padding: EdgeInsets.only(right: 100),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Text('Rocket Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                               Text((widget.launchPastDetail['rocket']['rocket_name']!=null?widget.launchPastDetail['rocket']['rocket_name']:'rocket Name not found')
                               )
                             ],
                           ),
                         ),
      
                         SizedBox(height: tDefaultPadding,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Text('Launch Date',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                             Text((widget.launchPastDetail['launch_date_local']!=null?widget.launchPastDetail['launch_date_local']:'not Found')
                             )
                           ],
                         ),
      
                          SizedBox(height: tDefaultPadding,),
                         Padding(
                           padding: EdgeInsets.only(right: 100),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Text('Is Launch Sussesful',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                               Text((widget.launchPastDetail['launch_success'].toString()!=null?widget.launchPastDetail['launch_success'].toString():'not Found'))
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(tDefaultPadding),
                   child: Text('Details',style: TextStyle(color: tPrimaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
                 ),
                Padding(
                  padding:  EdgeInsets.all(tDefaultPadding),
                  child: Container(
                    decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                           boxShadow: [
                            BoxShadow(
                            color: Color(0x29000000),
                             offset: Offset(0, 3),
                               blurRadius: 6,
                               ),
                                  ],
                       ),
                       child: Padding(
                         padding: EdgeInsets.all(tDefaultPadding),
                         child: Text((widget.launchPastDetail['details']!=null?widget.launchPastDetail['details']:'Detail not found')
                         ,style: TextStyle(fontWeight: FontWeight.bold),),
                       ),
                  ),
                )
          ],    
        ),
      ),
    );
  }
}