
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../constants.dart';
import '../../main.dart';
import 'detailScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
bool isChecked = false;
 bool ischecked2 =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackground,
      appBar: AppBar(
         actions: [
          Padding(
            padding: const EdgeInsets.only(right: tDefaultPadding),
            child: Icon(Icons.person,color: Colors.black,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: tDefaultPadding),
            child: Icon(Icons.notification_important,color: Colors.black,),
          )
        ],
        title: Center(
            child: Text('Launch List',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
            color: tBackgroundColor,),),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu,color: Colors.black,)
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Query(
        options: QueryOptions(
          document: gql(productsGrapghql)
          ),
       builder: (QueryResult result,{fetchMore , refetch}){
         
         if(result.hasException){
           return Text(result.hasException.toString());
         }
         if(result.isLoading){
           return Center(child: CircularProgressIndicator());
         }
         //Api hit
         var launchPast = result.data?['launchesPast'];
         print(launchPast);
         return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: tDefaultPadding/2),
          child: Container(
            height: MediaQuery.of(context).size.height/12,
            decoration: BoxDecoration(
               color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              TextButton(
                onPressed: (){
                   //Bottom Sheet
                    showModalBottomSheet(
            context: context,
  builder: (BuildContext context) {
    return BottomSheet(     
      onClosing: () {},
      builder: (BuildContext context) {
        isChecked=false;
        ischecked2=false;
        return StatefulBuilder(
          builder: (BuildContext context, setState) => Container(
            height:220,
            child: Column(
              children: [
                Row(
                children: [
               Align(
             alignment: Alignment.centerLeft,
            child: IconButton(
               onPressed: () {
               Get.back();
                     },
                                             icon: Icon(
                                                    Icons.close,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Sort By',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        Divider(color: Colors.grey,),

                                   SizedBox(height: tDefaultPadding,),
                                     
                                     
                                      Row(
                                  children: [
                               Container(
                             child: Checkbox(
                            activeColor: Colors.amber,
                           checkColor: Colors.white,
                            value: isChecked,
                              onChanged: (bool? value){
                           setState(() {
                             isChecked =value!;
                        } 
                      );
                    },
             ),
           ),
           Text('Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)

             ],
           ),
                                 SizedBox(height: tDefaultPadding,),
                                   Row(
                                  children: [
                               Container(
                             child: Checkbox(
                            activeColor: Colors.amber,
                           checkColor: Colors.white,
                            value: ischecked2,
                              onChanged: (bool? value){
                           setState(() {
                             ischecked2 =value!;
                        } 
                      );
                    },
             ),
           ),
           Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)

             ],
           ),
                           


              ],
            ),
          ),
        );
      },
    );
  },
);
                                }, 
                       child: Row(
                  children: [
                   Icon(Icons.sort,color: Colors.black,),
                   Text('Sort',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)
                  ],
                )
                ),

                Container(height: 30, child: VerticalDivider(color: Colors.black)),
                  
                   TextButton(
                onPressed: (){

                }, 
                child: Row(
                  children: [
                   Icon(Icons.sort,color: Colors.black,),
                   Text('Filter',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),)
                  ],
                )
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: tDefaultPadding),
        Expanded(
          child: ListView.builder(
                  itemCount: launchPast.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
              padding: EdgeInsets.all(tDefaultPadding),
              child: Container(
                height: MediaQuery.of(context).size.height / 4.1,
                decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
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
            Expanded(
              flex: 7,
              child: GestureDetector(
                onTap: () {
                Get.to(() => HomeDetailScreen(launchPastDetail:launchPast[index] ));

                },
                child: Container(
                  child:CachedNetworkImage(
                    imageUrl: (launchPast[index]['links']['mission_patch_small']!=null)?
                 launchPast[index]['links']['mission_patch_small']:'https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png',
                    // placeholder: (context, url) =>
                    //     Text('Loading Image'),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ), 
                // Image.network(
                //    (productList[index]['links']['mission_patch_small']!=null)?
                //  productList[index]['links']['mission_patch_small']:'https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png')
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20),
                            child: Text(
                              launchPast[index]['mission_name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20),
                            child: Text(
                              launchPast[index]['launch_date_local'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
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
        ),
      ],        
    );
      
       }
       )
    );
  }
}

// Get.to(() => Categories());