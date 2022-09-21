import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/model/new_match.dart';

class CoordinationDataScreen extends StatefulWidget {
  //const CoordinationDataScreen({Key? key}) : super(key: key);
  List<NewMatch> clothList=[];
CoordinationDataScreen({required this.clothList});
  @override
  State<CoordinationDataScreen> createState() => _CoordinationDataScreenState();
}

class _CoordinationDataScreenState extends State<CoordinationDataScreen> {
 DateTime? _choose;
 DateTime? _choose1;
 // DateTime dateTime=DateTime(2022,7,5,9,1);
DateTime? dateTime;
DateTime? dateTime1;
Object? country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
         backgroundColor: Color(0xfff7f7f7),
      //Start Of AppBar
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'بيانات التنسيق',
          style: GoogleFonts.cairo(
              textStyle: TextStyle(fontSize: 17, color: Color(0xff1a2e35),fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff7f7f7),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      //End Of AppBar
      body: SafeArea(
        
        child: Padding(
        padding: const EdgeInsets.only(right: 18, left: 18),
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          /*  Container(
              margin: EdgeInsets.only(top: 0),
              child: Image.asset('images/images.jfif'),
            ),*/
           Expanded(
              
                      child: ListView.builder(
                        itemCount:widget.clothList.length,
                        itemBuilder:(context,i){
                          return Container(
                            height: 90,
                            width: 90,
                            child: Image.asset('${widget.clothList[i].image}'));
                        }
                        )
                      ),
              
              
            
            SizedBox(
              height: 12,
            ),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                'ادخل وصف مناسب للتنسيق اعلاه',
                style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14,color: Color(0xff1a2e35))),
              ),
            ),
            //Start Of TextFormField
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'الوصف',
                  //fontfamily:tajawal-meduim
                  hintStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14,fontFamily:'Tajawal'),
                  fillColor: Colors.grey[200],
                  border: InputBorder.none),
            ),
            //End Of TextFormField
            SizedBox(
              height: 22,
            ),
        //Text('${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour} : ${dateTime.minute}'),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                'نوع التذكير',
                style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14,color: Color(0xff1a2e35))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Start Of Radio Button
          /*  Row(
              children: [
                Radio<DateTime>(
                    value: dateTime ?? DateTime.now(),
                    groupValue: _choose,
                    onChanged: (val)async {
                       dateTime1=null;
                 DateTime? newDate  = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(),
                         firstDate: DateTime(2020),
                          lastDate: DateTime(2090)
                          );
                     TimeOfDay? newTime= await showTimePicker(
                            context: context, 
             initialTime: TimeOfDay(hour:12 , minute: 1)
                            );
                          if(newDate == null) return;
                          if(newTime == null) return ;
        final newDateTime= DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        newTime.hour,
        newTime.minute
        );
                      setState(() {
                          dateTime=newDateTime;
                        _choose = val!;
                      
                      });
        
                    }),
                Text(
                  'تذكير مرة واحدة فقط',
                  style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14)),
                ),
              ],
            ),*/
             Row(
              children: [
                Radio(
                    //value: dateTime ?? DateTime.now(),
                   value: 'usa',
                    //groupValue: _choose,
                   groupValue: country,
                   fillColor: MaterialStateColor.resolveWith((states) => Color(0xff7D5C77)),
                    onChanged: (val) {
                      dateTime1=null;
                      /* dateTime1=null;
                 DateTime? newDate  = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(),
                         firstDate: DateTime(2020),
                          lastDate: DateTime(2090)
                          );
                     TimeOfDay? newTime= await showTimePicker(
                            context: context, 
             initialTime: TimeOfDay(hour:12 , minute: 1)
                            );
                          if(newDate == null) return;
                          if(newTime == null) return ;
        final newDateTime= DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        newTime.hour,
        newTime.minute
        );*/
                      setState(() {
                          //dateTime=newDateTime;
                        //_choose = val!;
                      country=val;
                      //print(_choose);
                      });
        
                    }),
                Text(
                  'تذكير مرة واحدة فقط',
                  style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 17,color: Color(0xff1a2e35))),
                ),
              ],
            ),
             Container(
              width: 400,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
        
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('تاريخ ووقت التذكير',style: TextStyle(fontSize: 16,color: Colors.black),),
                /* dateTime1=null;
                 DateTime? newDate  = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(),
                         firstDate: DateTime(2020),
                          lastDate: DateTime(2090)
                          );
                     TimeOfDay? newTime= await showTimePicker(
                            context: context, 
             initialTime: TimeOfDay(hour:12 , minute: 1)
                            );
                          if(newDate == null) return;
                          if(newTime == null) return ;
        final newDateTime= DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        newTime.hour,
        newTime.minute
         setState(() {
                          //dateTime=newDateTime;
                        //_choose = val!;
                      country=val;
                      //print(_choose);
                      });
        );*/
            GestureDetector(
        onTap: ()async{
          if(country =='uae'){
        dateTime=null;
          }else{
        DateTime? newDate  = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(),
                         firstDate: DateTime(2020),
                          lastDate: DateTime(2090),
                           builder: (context,child){
                            return Theme(
                              data:Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary:Color(0xff7D5C77) ,
                                  onPrimary: Colors.white,
                                  onSurface:Colors.black
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff7D5C77)
                                  )
                                )
                              ) , 
                            child: child!
                            );
                          }
                          );
                     TimeOfDay? newTime= await showTimePicker(
                       builder: (context,child){
                            return Theme(
                              data:Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary:Color(0xff7D5C77) ,
                                  onPrimary: Colors.white,
                                  onSurface:Colors.black
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff7D5C77)
                                  )
                                )
                              ) , 
                            child: child!
                            );
                          }
                            context: context, 
             initialTime: TimeOfDay(hour:12 , minute: 1)
                            );
                          if(newDate == null) return;
                          if(newTime == null) return ;
        final newDateTime= DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        newTime.hour,
        newTime.minute
        
        );
        setState(() {
                          dateTime=newDateTime;
                        //_choose = val!;
                      //country=val;
                      //print(_choose);
                      });
        }},
        child: Text(dateTime==null ?'غير محدد': 
        '${dateTime!.day}/${dateTime!.month}/${dateTime!.year} \n ${dateTime!.hour} : ${dateTime!.minute}',
        style: TextStyle(fontFamily:'Tajawal',fontSize: 13,color:Color(0xff9B9B9B)),
        ),
            ),
                ],
              ),
            ),
            
        
            //End of radio button
            //start of date
           
            //end of date
            Row(
              children: [
                Radio(
                    //value: dateTime1 ?? DateTime.now(),
                    value:'uae',
                   // groupValue: _choose,
                   groupValue: country,
                   fillColor: MaterialStateColor.resolveWith((states) => Color(0xff7D5C77)),
                    onChanged: (val) {
                      dateTime=null;
                       setState(() {
                          //dateTime=newDateTime;
                        //_choose = val!;
                      country=val;
                      //print(_choose);
                      });
                       /*dateTime=null;
                 DateTime? newDate1  = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(),
                         firstDate: DateTime(2020),
                          lastDate: DateTime(2090)
                          );
                     TimeOfDay? newTime1= await showTimePicker(
                            context: context, 
             initialTime: TimeOfDay(hour:12 , minute: 1)
                            );
                          if(newDate1 == null) return;
                          if(newTime1 == null) return ;
        final newDateTime1= DateTime(
        newDate1.year,
        newDate1.month,
        newDate1.day,
        newTime1.hour,
        newTime1.minute
        );
        
                      setState(() {
                       
                          dateTime1=newDateTime1;
                        _choose = val!;
                      
                      });*/
        
                    }),
                Text(
                  'تذكير كل فترة',
                  style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 17,color: Color(0xff1a2e35))),
                ),
              ],
            ),
           
         
            // End Of Radio Button
            //start of date
             Container(
              width: 400,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
        
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('اليوم',style: TextStyle(fontSize: 16,color: Colors.black)),
                  //dateTime.toString()
            GestureDetector(
        onTap: ()async{
          if(country == 'usa'){
            dateTime1=null;
          }else{
            DateTime? newDate1  = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(),
                         firstDate: DateTime(2020),
                          lastDate: DateTime(2090),
                          builder: (context,child){
                            return Theme(
                              data:Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary:Color(0xff7D5C77) ,
                                  onPrimary: Colors.white,
                                  onSurface:Colors.black
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff7D5C77)
                                  )
                                )
                              ) , 
                            child: child!
                            );
                          }
                          );
                     TimeOfDay? newTime1= await showTimePicker(
                       builder: (context,child){
                            return Theme(
                              data:Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary:Color(0xff7D5C77) ,
                                  onPrimary: Colors.white,
                                  onSurface:Colors.black
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff7D5C77)
                                  )
                                )
                              ) , 
                            child: child!
                            );
                          }
                            context: context, 
             initialTime: TimeOfDay(hour:12 , minute: 1)
                            );
                          if(newDate1 == null) return;
                          if(newTime1 == null) return ;
        final newDateTime1= DateTime(
        newDate1.year,
        newDate1.month,
        newDate1.day,
        newTime1.hour,
        newTime1.minute
        );
         setState(() {
                       
                          dateTime1=newDateTime1;
                     
                      
                      });
                     
        }},
        child: Text(dateTime1==null ?'غير محدد': 
        '${dateTime1!.day}/${dateTime1!.month}/${dateTime1!.year}',
        style: TextStyle(fontFamily:'Tajawal',fontSize: 13,color:Color(0xff9B9B9B)),
        ),
            ),
                ],
              ),
            ),
            //end of date
            
            SizedBox(height: 10,),
            //start of date
               Container(
              width: 400,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
        
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('الوقت',style: TextStyle(fontSize: 16,color: Colors.black),),
                  //dateTime.toString()
            Text(dateTime1==null ?'غير محدد': 
            ' ${dateTime1!.hour} : ${dateTime1!.minute}',style:TextStyle(fontFamily:'Tajawal',fontSize: 13,color:Color(0xff9B9B9B))
            ),
                ],
              ),
            ),
            //end of date
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'حفظ',
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff7D5C77),
                  fixedSize: Size(257, 56),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 0),
            )
          ],
        ),
      )),
    );
  }
}