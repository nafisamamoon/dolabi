import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/controller/favorite_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/dolabi/model/favorite.dart';
class FavoriteScreen extends StatefulWidget {
  //const FavoriteScreen({Key? key}) : super(key: key);
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
FavoriteController controller=Get.put(FavoriteController());



 /*void initState(){
super.initState();
setupFav();
  }*/

  @override
  Widget build(BuildContext context) {
    
    //print(controller.mylist.length);
    return Scaffold(
         backgroundColor: Color(0xfff7f7f7),
      body:controller.load == false? GetBuilder<FavoriteController>(
        builder: (controller){
          return b1();
        }
        ):b2()
    );
  }
}
class b1 extends StatelessWidget {
  const b1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color(0xfff7f7f7),
      body:SafeArea(child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
             Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'المفضلة',
                          style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 42,color: Color(0xff1a2e35))),
                        )),
                    SizedBox(height: 100),
                    Image.asset('images/j.jpg',width: 332,height: 248,),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'لا يوجد لديك ملابس في المفضلة',
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)))
          ],
        ),
      ))
    );
  }
}

class b2 extends StatefulWidget {
 // const b2({ Key? key }) : super(key: key);

  @override
  State<b2> createState() => _b2State();
}

class _b2State extends State<b2> {
     SharedPreferences? pref;
List<Favorite> favoriteList=[];
setupFav()async{
pref=await SharedPreferences.getInstance();
String? stringFav=pref!.getString('fav' );
List favList=jsonDecode(stringFav!);
for(var fav in favList){
  setState(() {
    favoriteList.add(Favorite().fromJson(fav));
  });
  print('//////////////////');
  print(favoriteList.length);
}
}
@override
  void initState() {
    // TODO: implement initState
    setupFav();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      var _crossAxisiSpacing= 11.0,_mainAxisiSpacing=9.0,_aspectRaito=0.6;
    int _crossAxsisCount=2;
    double screenWidyh=MediaQuery.of(context).size.width;
    
    var wi=(screenWidyh - ((_crossAxsisCount -1) *  _crossAxisiSpacing)) / _crossAxsisCount;
    var hi=wi/_aspectRaito;
     var width=MediaQuery.of(context).size.width;
      var hig=MediaQuery.of(context).size.height;
      ////////////////////
         double _screenWidyh=MediaQuery.of(context).size.width;
       var wid=(_screenWidyh-((_crossAxsisCount-1)*_crossAxisiSpacing)) /_crossAxsisCount;
       var cellHig=260;
       var _asp=wid/cellHig;
    return Scaffold(
      appBar: AppBar(elevation: 0,
      backgroundColor: Colors.white30
      ),
      body: SafeArea(
            child:  Padding(
                padding: EdgeInsets.only(top:25 ,left:17,right: 17,bottom: 17),
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
                           //childAspectRatio: .7,
                              crossAxisSpacing: _crossAxisiSpacing
                              ),
                          itemCount: favoriteList.length,
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
                                child: Image.file(File(favoriteList[i].image),fit: BoxFit.fill,)
                              ),
                            ),
                            SizedBox(height: 6,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
//SizedBox(height: 4,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
 Text(
                                          '${favoriteList[i].name}',
                                      style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      ),
 
                                    GestureDetector(
                                    onTap: () {
                                    
                                    },
                                    child: Image.asset(
                                      'images/favorite_tab_active.png',
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
                            //////////////////////////////
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13)),
                              elevation: 4,
                              child: Column(
                                children: [
                                  //Start image container
                                  Container(
                                   // height: 200,
                                   // width: 300,
                                   height: 160,
                                        width: 199,
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),    
                                      child: Image.file(File(favoriteList[i].image),fit: BoxFit.fill,))
                                  ),
                                //End image container
                                //Start date
                                 SizedBox(height: 11,),
                                  //End date
                                  //Start name and share button
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text(
                                      '${favoriteList[i].name}',
                                      style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                    
                                    },
                                    child: Image.asset(
                                      'images/favorite_tab_active.png',
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
            /*  favoriteList.length !=null?    Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: favoriteList.length,
                      itemBuilder: (context,i){
                        return Image.file(File(favoriteList[i].image));
                      }
                      ),
                   ):
                   ,
                    )*/
                  ],
                ))
             ),
    );
  }
}