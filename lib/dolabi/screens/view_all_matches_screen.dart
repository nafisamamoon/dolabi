import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/model/event.dart';
class ViewAllMatchesScreen extends StatelessWidget {
  //const ViewAllMatchesScreen({ Key? key }) : super(key: key);
List<Event>? mylist=[];
String? currenttime;
//ViewAllMatchesScreen({this.mylist,this.currenttime});
ViewAllMatchesScreen({List<Event>? x,String? y}) : mylist=x != null ? x:[],currenttime=y!=null?y:'';
  @override
  Widget build(BuildContext context) {
   
     var _crossAxisiSpacing= 11.0,_mainAxisiSpacing=20.0,_aspectRaito=0.6;
    int _crossAxsisCount=2;
    double screenWidyh=MediaQuery.of(context).size.width;
    bool load=false;
  
    var wi=(screenWidyh - ((_crossAxsisCount -1) *  _crossAxisiSpacing)) / _crossAxsisCount;
    var hi=wi/_aspectRaito;
     var width=MediaQuery.of(context).size.width;
      var hig=MediaQuery.of(context).size.height;
      //////////////////////////
        double _screenWidyh=MediaQuery.of(context).size.width;
       var wid=(_screenWidyh-((_crossAxsisCount-1)*_crossAxisiSpacing)) /_crossAxsisCount;
       var cellHig=280;
       var _asp=wid/cellHig;
    return mylist!.isNotEmpty?
    Scaffold(
         backgroundColor: Color(0xfff7f7f7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(11),
        child: Column(
          children: [
 Expanded(
            
                  child: 
                     
                       GridView.builder(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: _crossAxsisCount,
                            mainAxisSpacing: _mainAxisiSpacing,
                            //childAspectRatio: 0.7,
                            //childAspectRatio:MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.4),
                            //mainAxisExtent:h/2,
                           // childAspectRatio: _aspectRaito,
                           childAspectRatio: _asp,
                            crossAxisSpacing: _crossAxisiSpacing
                            ),
                        itemCount: mylist!.length,
                        itemBuilder: (context, i) {
                          return
                          Padding(
                            padding: const EdgeInsets.all(11),
                            child: Container(
                    width: 220,
                    //height: 244,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0,3)
                        )
                      ]
                    ),
                    child: Column(
                     // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Container(
                              height: 170,
                              width: 380,
                         
                              child: ClipRRect(
             borderRadius:BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),                 
                                child:Image.file(
                                     
                                      File( mylist![i].image!.path),
                                      fit: BoxFit.fill,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
 Text(
                                      currenttime!,
                                      style: GoogleFonts.cairo(
                                          textStyle:
                                              TextStyle(color: Color(0xff929292),fontSize: 14)),
                                    ),
//SizedBox(height: 4,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
 Expanded(
   child: Text(
                                    '${mylist![i].title}',
                                    style: GoogleFonts.cairo(
                                        textStyle: TextStyle(
                                           color: Color(0xff1a2e35),
                                             fontWeight: FontWeight.bold,fontSize: 17)),
                                  ),
 ),
    GestureDetector(
                                  onTap: () {
                                  
                                  },
                                  child: Image.asset(
                                    'images/share.png',
                                    width: 20,
                                  ),
                                )
  ],
)
                                ],
                              ),
                            )
              ,   

                      ],
                    ),
                  ),
                          );
                          //////////////////////////
                           Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            elevation: 4,
                            child: Column(
                              children: [
                                //Start image container
                                Container(
                                //  height: 200,
                                  //width: 300,
                                    height: 160,
                                width: 199,
                                  child: ClipRRect(
                                     borderRadius:BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),  
                                    child: Image.file(
                                     
                                      File( mylist![i].image!.path),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              //End image container
                              //Start date
                                Padding(
                                  padding: EdgeInsets.only(right: 14),
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      currenttime!,
                                      style: GoogleFonts.cairo(
                                          textStyle:
                                              TextStyle(color: Color(0xff929292),fontSize: 14)),
                                    ),
                                  ),
                                ),
                                //End date
                                //Start name and share button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Text(
                                    '${mylist![i].title}',
                                    style: GoogleFonts.cairo(
                                        textStyle: TextStyle(
                                           color: Color(0xff1a2e35),
                                             fontWeight: FontWeight.bold,fontSize: 17)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                  
                                  },
                                  child: Image.asset(
                                    'images/share.png',
                                    width: 20,
                                  ),
                                )
                                  ],
                                )
                                //End name and share button
                              ],
                            ),
                          );
                        })
                   
                )
          ],
        ),
        )
        ),
    ) :Scaffold(
         backgroundColor: Color(0xfff7f7f7),
      appBar: AppBar(
        backgroundColor:  Color(0xfff7f7f7),
        elevation: 0,
      ),
      body: SafeArea(child: Padding(
  padding: const EdgeInsets.all(25),
  child:   SingleChildScrollView(
    child: Column(
    
      children: [
    SizedBox(height: 140,),
     Center(child: Image.asset('images/j.jpg',width: 332,height: 248,)),
     SizedBox(height: 20,),
     Text('لا يوجد لديك ملابس',style: GoogleFonts.cairo(
                            textStyle: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1a2e35),fontSize: 17))),                 
    
      ],
    
    ),
  ),
))
    );
     
  }
}