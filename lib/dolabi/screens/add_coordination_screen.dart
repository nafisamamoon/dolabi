
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/model/new_match.dart';
import 'package:travel/dolabi/screens/move_image_screen.dart';

class AddCoordinationScreen extends StatefulWidget {
  const AddCoordinationScreen({Key? key}) : super(key: key);

  @override
  State<AddCoordinationScreen> createState() => _AddCoordinationScreenState();
}

class _AddCoordinationScreenState extends State<AddCoordinationScreen> {
  //bool use=false;
  // bool a=false;
  List<bool> _list = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> _list2 = [true, true, true, true, true, true, true, true, true];
  //Add Or Remove Element By User In This List
  List<NewMatch> _newList = [];
  //List Of Element(Image,Name)
  List<NewMatch> _newMatch = [
    NewMatch(name: 'تونيك', image: 'images/f.jpg'),
    NewMatch(name: 'تيشيرت', image: 'images/h.jpg'),
    NewMatch(name: 'تونيك', image: 'images/h.jpg'),
    NewMatch(name: 'تيشيرت', image: 'images/f.jpg'),
    NewMatch(name: 'تيشيرت', image: 'images/n.jfif'),
    NewMatch(name: 'تيشيرت', image: 'images/m.jfif'),
    NewMatch(name: 'تيشيرت', image: 'images/images.jfif'),
    NewMatch(name: 'تيشيرت', image: 'images/images.jfif'),
    NewMatch(name: 'تيشيرت', image: 'images/images.jfif'),
  ];
  
  @override
  Widget build(BuildContext context) {
      var _crossAxisiSpacing= 11.0,_mainAxisiSpacing=20.0,_aspectRaito=0.6;
    int _crossAxsisCount=2;
    double screenWidyh=MediaQuery.of(context).size.width;
    
    var wi=(screenWidyh - ((_crossAxsisCount -1) *  _crossAxisiSpacing)) / _crossAxsisCount;
    var hi=wi/_aspectRaito;
    ////////////////////////////////
       double _screenWidyh=MediaQuery.of(context).size.width;
       var wid=(_screenWidyh-((_crossAxsisCount-1)*_crossAxisiSpacing)) /_crossAxsisCount;
       var cellHig=250;
       var _asp=wid/cellHig;
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      //AppBar
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor:  Color(0xfff7f7f7),
          title: Text(
            'اضافة تنسيق',
            style: GoogleFonts.cairo(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff1a2e35))),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)),
              actions: [
Padding(
  padding: const EdgeInsets.only(top:5,left: 23),
  child:   Image.asset('images/he.png',width:20),
)
              ],
              ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(19),
              child: Column(
                children: [
                  //The Horizontal Scroll List
                  Container(
                    height: 100,
                    child: ListView.separated(
                        separatorBuilder: (context, i) {
                          return SizedBox(
                            width: 8,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: _newList.length,
                        itemBuilder: (context, i) {
                          return Stack(
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                child: Image.asset('${_newList[i].image}'),
                              ),
                              Positioned(
                                  child: Container(
                                alignment: Alignment.topLeft,
                                child: Checkbox(
                                  //high:27
                                    activeColor: Color(0xff7D5C77),
                                    shape: CircleBorder(),
                                    value: _list2[i],
                                    onChanged: (val) {
                                      setState(() {
                                        _list[i] = val!;
                                        _newList.remove(_newList[i]);

                                        print('//////////////');
                                        print(_newList.length);
                                      });
                                    }),
                              ))
                            ],
                          );
                        }),
                  ),

                //Start Of GridView
                  Expanded(
                 
                    child: LayoutBuilder(
                      builder: (context,constraints){
                         var h=constraints.maxHeight;
                        return GridView.builder(
                          physics: ScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: _crossAxsisCount,
                              mainAxisSpacing: _mainAxisiSpacing,
                            // childAspectRatio: _aspectRaito,
                            childAspectRatio: _asp,
                            // mainAxisExtent: h/2.4,
                              crossAxisSpacing: _crossAxisiSpacing
                              ),
                          itemCount: _newMatch.length,
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
                        Stack(
                          children: [
  Container(
                              height: 160,
                              //width: 380,
                         width: 199,
                              child: ClipRRect(
             borderRadius:BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),                 
                                child: Image.asset(
                                            '${_newMatch[i].image}',
                                            fit: BoxFit.fill,
                                          ),
                              ),
                            ),
                               Positioned(
                                          // right: 200,
                                          child: Container(
                                        alignment: Alignment.topLeft,
                                        child: Checkbox(
                                            activeColor: Color(0xff7D5C77),
                                            shape: CircleBorder(),
                                            value: _list[i],
                                            onChanged: (val) {
                                              setState(() {
                                                _list[i] = val!;
                                                if (val == true) {
                                                  _newList.add(_newMatch[i]);
                                                  //method for show bottom sheet
                                                  continnueButton();
                                                } else {
                                                  _newList.remove(_newMatch[i]);
                                                }
                                              });
                                            }),
                                      ))
                          ],
                        ),
                       
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
   Text(
                                        '${_newMatch[i].name}',
                                        style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,color:Color(0xff1a2e35) )))
//SizedBox(height: 4,),

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
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13)),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        //height: 200,
                                        //width: 300,
                                        height: 160,
                                        width: 199,
                                        child: ClipRRect(
                           borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),
                                          child: Image.asset(
                                            '${_newMatch[i].image}',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          // right: 200,
                                          child: Container(
                                        alignment: Alignment.topLeft,
                                        child: Checkbox(
                                            activeColor: Color(0xff7D5C77),
                                            shape: CircleBorder(),
                                            value: _list[i],
                                            onChanged: (val) {
                                              setState(() {
                                                _list[i] = val!;
                                                if (val == true) {
                                                  _newList.add(_newMatch[i]);
                                                  //method for show bottom sheet
                                                  continnueButton();
                                                } else {
                                                  _newList.remove(_newMatch[i]);
                                                }
                                              });
                                            }),
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 14),
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        '${_newMatch[i].name}',
                                        style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,color:Color(0xff1a2e35) )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                      },
                    
                    ),
                  )
                ],
              ))),
    );
  }
//method show bottom sheet
  continnueButton() {
    showModalBottomSheet(
      
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            child: Container(
              child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff7D5C77),
                  fixedSize: Size(257, 56),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 0),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MoveImageScreen(list: _newList,)));
              },
              child: Text('متابعة', style: GoogleFonts.cairo(
                textStyle: TextStyle(
                 
                    fontSize: 18,
                    color: Colors.white)),))
            ],
          ),
            ),
          );
        });
  }
}
