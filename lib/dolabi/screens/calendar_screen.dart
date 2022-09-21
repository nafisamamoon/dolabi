
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:travel/dolabi/model/event.dart';
import 'package:travel/dolabi/screens/view_all_matches_screen.dart';

class CalenderScreen extends StatefulWidget {
  //const CalenderScreen({ Key? key }) : super(key: key);
  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime date = DateTime(2022, 12, 24);
  DateTime selectedDate = DateTime.now();
  DateTime focusDate = DateTime.now();
  DateTime dayNow = DateTime.now();
PickedFile? _imageFile;
final ImagePicker _picker=ImagePicker();
  Map<DateTime, List<Event>>? selectedEvents;
  TextEditingController _eventController = TextEditingController();
  String? currentTime;
  File? image;
  final imagePicker = ImagePicker();
// For Upload Image From Gallery
  uploadImage() async {
    var pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
        print('////////////');
        print(image!.path);
      });
    } else {}
  }
  ///////////////////
  

  @override
  void initState() {
    // TODO: implement initState
    selectedEvents = {};
    super.initState();
  }

  List<Event> ev = [];

  List<Event> _getEventFromDay(DateTime date) {
    return selectedEvents![date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
          String cur= '${dayNow.year.toString()}-${dayNow.month.toString().padLeft(2, '0')}-${dayNow.day.toString().padLeft(2, '0')}';

    return Scaffold(
        backgroundColor: Color(0xfff7f7f7),
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              alignment: Alignment.bottomRight,
              child: Text(
                'تقويم التنسيقات',
                style: GoogleFonts.cairo(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 42,color:Color(0xff1a2e35))),
              )),
              //Start Of Calender Code
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TableCalendar(
              focusedDay: focusDate,
              firstDay: DateTime(2020),
              lastDay: DateTime(2050),
              startingDayOfWeek: StartingDayOfWeek.sunday,
              onDaySelected: (DateTime selectDate, DateTime focuDate) {
                setState(() {
                  selectedDate = selectDate;
                  currentTime =
                      '${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
                  focusDate = focuDate;
                });
              },
              calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      color: Color(0xff7D5C77), shape: BoxShape.circle)),
              selectedDayPredicate: (day) {
                return isSameDay(selectedDate, day);
              },
              daysOfWeekStyle: DaysOfWeekStyle(),
              pageAnimationCurve: Curves.easeOutQuad,
              eventLoader: _getEventFromDay,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
               // leftChevronIcon: Icon(Icons.chevron_left),
                //rightChevronPadding: EdgeInsets.only(left: 180),
              ),
            ),
          ),
          //End Of Calender Section
          SizedBox(
            height: 40,
          ),
          //Start Of ROW
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'تنسيقات يوم الأحد ',
                style: GoogleFonts.cairo(textStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 17)),
              ),
               Expanded(
                child: Text(
                 currentTime ?? cur,
                  style: GoogleFonts.cairo(textStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 17)),
                ),
              ),
             
               Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff7D5C77),
                      fixedSize: Size(100, 42),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 0),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewAllMatchesScreen(
                      x: selectedEvents![selectedDate],y:  currentTime,
                    )));
                  },
                  child: Text(
                    'عرض الكل',
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(color: Colors.white,fontSize: 14)),
                  ),
                ),
              )
            ],
          ),
//End Of ROW
          SizedBox(
            height: 40,
          ),
          //Start Of Section Show The Outfits Based On Selected Date by user From Calender
          selectedEvents![selectedDate] == null
              ? Text(
                  'لا يوجد تنسيقات في هذا التاريخ',
                  style: GoogleFonts.cairo(textStyle: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1a2e35),fontSize: 20)),
                )
              : 
                 Container(
              height: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedEvents![selectedDate]!.length,
                itemBuilder: (context,i){
                  if(i<5){
return Padding(padding:EdgeInsets.symmetric(vertical: 15,horizontal:5) ,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Container(
                    width: 220,
                    height: 244,
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
                              child: Image.file(
                                   File(selectedEvents![selectedDate]![i].image!.path) ,
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
                                  currentTime!,
                                  style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                        color: Color(0xff707070),fontSize: 16)),
                                ),
//SizedBox(height: 4,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
 Text(
                                      '${selectedEvents![selectedDate]![i].title}',
                                      style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                            color: Color(0xff1a2e35),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
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
                  )
                ],
              ),
              );
                  }else{
                    return Text('');
                  }
                    
                  
                
              },),
            ),
            /*  Container(
                  height: 320,
                  child: ListView.separated(
                      separatorBuilder: (context, i) {
                        return SizedBox(
                          width: 8,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedEvents![selectedDate]!.length,
                      itemBuilder: (context, i) {
                        return Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                
                                child: Image.file(
                                  selectedEvents![selectedDate]![i].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 66),
                                child: Text(
                                  currentTime!,
                                  style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[500])),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(right: 15, left: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${selectedEvents![selectedDate]![i].title}',
                                      style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Image.asset(
                                      'images/share.png',
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      }),
                ),*/
                //End of Section Show The Outfits Based On Selected Date From Calender
          SizedBox(
            height: 10,
          ),
   //Start Of Section Add New Outfits By Clicking The Button by user   
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff7D5C77),
                  fixedSize: Size(146, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  elevation: 0),
              onPressed: () {
                _imageFile=null;
                //Dialog
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: TextFormField(
                             cursorColor: Color(0xff7D5C77),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xff7D5C77))),
                            hintText: 'اضف عنوان',
                          ),
                          controller: _eventController,
                        ),
                        content: 
                           /* GestureDetector(
                              onTap:(){
imageProfile();
                              },
                              child: Container(
                                    height:180 ,
                                    width:180 ,
                                    child: CircleAvatar(
                                      radius:80,
                                      backgroundImage:_imageFile == null?AssetImage('images/add_cloth_image.png') :FileImage(File(_imageFile!.path)) as ImageProvider ,
                                    ),
                                  ),
                            ),*/
                            StatefulBuilder(
                              builder:(context,setStatee){
                                return GestureDetector(
                              onTap:(){
showDialog(
      context: context,
       builder: (context){
        return AlertDialog(
          title: Text('اختر صورة',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35)))),
         content: Row(
          children: [
            TextButton(
              onPressed: ()async{
final pickedFile=await _picker.getImage(source: ImageSource.camera);
   
  
     
   setStatee(() {
       _imageFile=pickedFile;
     
    });
              },
               child: Text('الكاميرا',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff7D5C77),fontSize: 14)))
               ),
                TextButton(
              onPressed: ()async{
final pickedFile=await _picker.getImage(source: ImageSource.gallery);
   
  
     
   setStatee(() {
       _imageFile=pickedFile;
     
    });
              },
               child: Text('الاستوديو',style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff7D5C77),fontSize: 14)))
               ),
          ],
         ),
         actions: [
          TextButton(onPressed: (){
              setStatee(() {
              
            });
            Navigator.of(context).pop();
          
          }, child: Text('OK',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35)))))
         ],
        );
       }
       );
                              },
                              child: Container(
                                    height:180 ,
                                    width:180 ,
                                    child: CircleAvatar(
                                      radius:80,
                                      backgroundImage:_imageFile == null?AssetImage('images/add_cloth_image.png') :FileImage(File(_imageFile!.path)) as ImageProvider ,
                                    ),
                                  ),
                            );
                              }
                              ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                
                               
                                if (_eventController.text.isEmpty && _imageFile == null) {
                                  Navigator.of(context).pop();
                                  return;
                                } else if(_eventController.text.isNotEmpty && _imageFile == null){
 Navigator.of(context).pop();
                                  return;
                                } else if(_eventController.text.isEmpty && _imageFile != null){
 Navigator.of(context).pop();
                                  return;
                                }
                            else    {
                                  if (selectedEvents![selectedDate] != null) {
                                    selectedEvents![selectedDate]!.add(Event(
                                        title: _eventController.text,
                                        image: _imageFile));
                                    currentTime =
                                        '${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
                                  } else {
                                    selectedEvents![selectedDate] = [
                                      Event(
                                          title: _eventController.text,
                                          image: _imageFile)
                                    ];
                                    currentTime =
                                        '${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
                                  }
                                }
                              
                                Navigator.pop(context);
                                _eventController.clear();
                                setState(() {});
                                return;
                              },
                              child: Text(
                                'اضافة',
                                style: GoogleFonts.cairo(
                                    textStyle:
                                        TextStyle(color: Color(0xff7D5C77))),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'اغلق',
                                style: GoogleFonts.cairo(
                                    textStyle:
                                        TextStyle(color: Color(0xff7D5C77))),
                              )),
                        ],
                      );
                    });
              },
              child: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'تنسيق جديد',
                    style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14)),
                  )
                ],
              )),
              //End Of Section Add New Outfits By Clicking The Button   
          

          SizedBox(
            height: 40,
          ),

    
        ],
      )),
    )));
  }
 imageProfile(){
    return showDialog(
      context: context,
       builder: (context){
        return AlertDialog(
          title: Text('اختر صورة',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35)))),
         content: Row(
          children: [
            TextButton(
              onPressed: (){
takePhoto(ImageSource.camera);
              },
               child: Text('الكاميرا',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff7D5C77),fontSize: 14)))
               ),
                TextButton(
              onPressed: (){
takePhoto(ImageSource.gallery);
              },
               child: Text('الاستوديو',style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff7D5C77),fontSize: 14)))
               ),
          ],
         ),
         actions: [
          TextButton(onPressed: (){
              setState(() {
              
            });
            Navigator.of(context).pop();
          
          }, child: Text('OK',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35)))))
         ],
        );
       }
       );
    /*GestureDetector(
      onTap: (){
        showModalBottomSheet(context: context, builder: (builder)=>bottomsheet());
      },
      child: Container(
        height:180 ,
        width:180 ,
        child: CircleAvatar(
          radius:80,
          backgroundImage:_imageFile == null?AssetImage('images/add_cloth_image.png') :FileImage(File(_imageFile!.path)) as ImageProvider ,
        ),
      ),
    );*/
  }
 /* Widget bottomsheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      child: Column(
        children: [
          Text('اختر صورة',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35))),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            FlatButton.icon(
              onPressed: (){
                    takePhoto(ImageSource.camera);
              },
               icon: Icon(Icons.camera,color:Color(0xff7D5C77) ,), 
               label: Text('الكاميرا',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14))
               )
               ),
            FlatButton.icon(
              onPressed: (){
                    takePhoto(ImageSource.gallery);
              },
               icon: Icon(Icons.image,color: Color(0xff7D5C77),), 
               label: Text('الاستوديو',style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14)),)
               ),
            
           
          ],)
          
        ],
      ),
    );
  }*/
  void takePhoto(ImageSource source)async{
    final pickedFile=await _picker.getImage(source: source);
   
  
     
   setState(() {
       _imageFile=pickedFile;
     
    });
    
  }
}