
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/model/matches_model.dart';
import 'package:travel/dolabi/screens/add_coordination_screen.dart';

class MatchesScreen extends StatelessWidget {
  //const MatchesScreen({ Key? key }) : super(key: key);
  //List Contain Outfits Name,Image And Date
  List<MatchesModel> _list = [
    MatchesModel(
        image: 'images/f.jpg', name: 'تنسيق الزفاف', day: '15/7/2022'),
    MatchesModel(
        image: 'images/h.jpg', name: 'تنسيق الجامعة', day: '15/7/2022'),
    MatchesModel(
        image: 'images/h.jpg', name: 'تنسيق الجامعة', day: 'بعد يومين'),
    MatchesModel(
        image: 'images/f.jpg', name: 'تنسيق الزفاف', day: 'بعد يومين'),
    MatchesModel(
        image: 'images/f.jpg', name: 'تنسيق الجامعة', day: '15/7/2022'),
    MatchesModel(
        image: 'images/h.jpg', name: 'تنسيق الجامعة', day: '15/7/2022'),
    MatchesModel(
        image: 'images/images.jfif', name: 'تنسيق الجامعة', day: '15/7/2022'),
    MatchesModel(
        image: 'images/f.jpg', name: 'تنسيق الجامعة', day: '15/7/2022'),
    MatchesModel(
        image: 'images/images.jfif', name: 'تنسيق الزفاف', day: '15/7/2022'),
    MatchesModel(
        image: 'images/images.jfif', name: 'تنسيق الزفاف', day: '15/7/2022'),
    MatchesModel(
        image: 'images/f.jpg', name: 'تنسيق الزفاف', day: '15/7/2022'),
  ];
  @override
  Widget build(BuildContext context) {
    var _crossAxisiSpacing= 11.0,_mainAxisiSpacing=20.0,_aspectRaito=0.6;
    int _crossAxsisCount=2;
    double screenWidyh=MediaQuery.of(context).size.width;
    
    var wi=(screenWidyh - ((_crossAxsisCount -1) *  _crossAxisiSpacing)) / _crossAxsisCount;
    var hi=wi/_aspectRaito;
     var width=MediaQuery.of(context).size.width;
      var hig=MediaQuery.of(context).size.height;
      var size=MediaQuery.of(context).size;
      ////////////////////
       double _screenWidyh=MediaQuery.of(context).size.width;
       var wid=(_screenWidyh-((_crossAxsisCount-1)*_crossAxisiSpacing)) /_crossAxsisCount;
      // var cellHig=318;
       var cellHig=262;
       var _asp=wid/cellHig;
    return Scaffold(
         backgroundColor: Color(0xfff7f7f7),
//Start of appbar
     /* appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white60,
      ),*/
      //End of appbar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              Container(
                //width/2
                  margin: EdgeInsets.only(left: width/3),
                  child: Text(
                    'التنسيقات',
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 42,color: Color(0xff1a2e35))),
                  )),
              SizedBox(
                height: 30,
              ),
              //Start Of GridView
        
             
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
                            //childAspectRatio: _aspectRaito,
                            childAspectRatio: _asp,
                            crossAxisSpacing: _crossAxisiSpacing
                            ),
                        itemCount: _list.length,
                        itemBuilder: (context, i) {
                          return Padding(
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
                              height: 160,
                              //width: 380,
                         width: 199,
                              child: ClipRRect(
             borderRadius:BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),                 
                                child: Image.asset(
                                    '${_list[i].image}' ,
                                      fit: BoxFit.cover,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
  Text(
                                   '${_list[i].day}',
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
                                            '${_list[i].name}',
                                       style: GoogleFonts.cairo(
                                           textStyle: TextStyle(
                                               color: Color(0xff1a2e35),
                                               fontWeight: FontWeight.bold,fontSize: 15)),
                                        ),
 ),
 Image.asset(
                                    'images/share.png',
                                    width: 20,
                                  ),
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
                          /*Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            elevation: 4,
                            child: Column(
                              children: [
                                //Start image container
                                Container(
                                //  height: 200,
                                //  width: 300,
                                height: 160,
                                width: 199,
                                  child: ClipRRect(
             borderRadius:BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),
                                    child: Image.asset(
                                    '${_list[i].image}',
                                    fit: BoxFit.fill,
                                  ),)
                                ),
                              //End image container
                              //Start date
                            
                                Padding(
                                  padding: EdgeInsets.only(right: 14),
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      '${_list[i].day}',
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
                                   Text(
                                     '${_list[i].name}',
                                     style: GoogleFonts.cairo(
                                         textStyle: TextStyle(
                                             color: Color(0xff1a2e35),
                                             fontWeight: FontWeight.bold,fontSize: 17)),
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
                               /* Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text(
                                      '${_list[i].name}',
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
                                      'images/share.png',
                                      width: 20,
                                    ),
                                  )
                                    ],
                                  ),
                                )*/
                                //End name and share button
                              ],
                            ),
                          );*/
                        })
                   
                )
            
           
           
              //End Of GridView
            ],
          ),
        ),
      ),
      //Start add new outfit button
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: width/2),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xff7D5C77),
              fixedSize: Size(146, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              elevation: 0),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddCoordinationScreen()));
          },
          child: Row(
            children: [
              Icon(Icons.add),
              SizedBox(
                width: 9,
              ),
              Text(
                'تنسيق جديد',
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(color: Colors.white,fontSize: 14)),
              )
            ],
          ),
        ),
      ),
       //End add new outfit button
    );
  }
}
/*
Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 6,
                            child: Column(
                              children: [
                                //Start image container
                                Container(
                                  height: 200,
                                  width: 300,
                                  child: Image.asset(
                                    '${_list[i].image}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              //End image container
                              //Start date
                            
                                Padding(
                                  padding: EdgeInsets.only(right: 14),
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      '${_list[i].day}',
                                      style: GoogleFonts.cairo(
                                          textStyle:
                                              TextStyle(color: Colors.grey[600])),
                                    ),
                                  ),
                                ),
                                //End date
                                //Start name and share button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                   Text(
                                     '${_list[i].name}',
                                     style: GoogleFonts.cairo(
                                         textStyle: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.bold)),
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
                               /* Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text(
                                      '${_list[i].name}',
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
                                      'images/share.png',
                                      width: 20,
                                    ),
                                  )
                                    ],
                                  ),
                                )*/
                                //End name and share button
                              ],
                            ),
                          )
*/