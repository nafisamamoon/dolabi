import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/screens/bottom_bar_screen.dart';
import 'package:travel/dolabi/screens/enter_new_password_screen.dart';
import 'package:travel/dolabi/screens/login_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  //bool variable for indicate what screen will be shown
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    //start of first screen which appear to the user before clicking زر التحقق
    var myBody = SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //App Icon
              Padding(
              padding: EdgeInsets.all(25),
              child:  Image.asset('images/d.png'),
             ),
              SizedBox(
                height: 90,
              ),
              Text('ادخل الرمز الذي تم ارسالة الى ',
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Colors.white,fontSize: 14))),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                //start of Card that contain field for entering the verification code
                child: Container(
                  height: 260,
                  width: 400,
                  child: Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(17),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' لم تتلقى اي رسالة ؟  ',
                                    style: GoogleFonts.cairo(
                                        textStyle: TextStyle(fontSize: 14))),
                                Text('أعد ارسال الرمز  ',
                                    style: GoogleFonts.cairo(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                            color: Color(0xffff7f10))))
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //Start of field that the user will enter the code in it
                            LayoutBuilder(
                              builder: (context,constraint){
                                  var h=constraint.maxWidth;
                                return Padding(
                                padding:  EdgeInsets.only(right: h/7),
                                child: Form(
                                    child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _textFieldOtp(true, false, context),
                                    SizedBox(width: 11,),
                                    _textFieldOtp(false, false, context),
                                       SizedBox(width: 11,),
                                    _textFieldOtp(false, false, context),
                                       SizedBox(width: 11,),
                                    _textFieldOtp(false, true, context),
                                  ],
                                )),
                              );
                              },
                             
                            ),
                            //End of field that the user will enter the code in it
                            SizedBox(height: 15,),
                            ElevatedButton(
   //When user press the button the content of the page will change and after 5 second he or she will navigate to password screen
                              onPressed: () {
                               
                                setState(() {
                                  circular = true;
                                  Future.delayed(Duration(seconds: 5), () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EnterNewPasswordScreen()));
                                  });
                                });

                                //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomBarScreen()));
                              },
                              child: Text(
                                'تحقق',
                                style: GoogleFonts.cairo(
                                    textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff7D5C77),
                                  fixedSize: Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  elevation: 0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                              },
                              child: Center(
                                  child: Text('الرجوع الى صفحة تسجيل الدخول',
                                      style: GoogleFonts.cairo(
                                          textStyle: TextStyle(fontSize: 14)))),
                            )
                          ],
                        ),
                      )),
                ),
                //End of Card that contain field for entering the verification code
              )
            ],
          ),
        ),
      ),
    );
      //End of first screen which appear to the user before clicking زر التحقق
   //start of second screen that appear to the user after clicking زر التحقق
    var loadBody = SafeArea(
      child: SingleChildScrollView(
        child: Container(
            child: Padding(
                padding: EdgeInsets.all(4),
                child: Column(
                  children: [
                    Padding(
              padding: EdgeInsets.all(25),
              child:  Image.asset('images/d.png'),
             ),
                    Text('ارسل الرمز الذي تم ارسالة الى',
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(color: Colors.white,fontSize: 14))),
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          height: 200,
                          child: Card(
                            elevation: 6,
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text('جاري ارسال رمز التحقق',
                                      style: GoogleFonts.cairo(
                                          textStyle:
                                              TextStyle(color: Colors.black,fontSize: 14))),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xff7d5c77),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'تحقق',
                                      style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xffc4b2c0),
                                        fixedSize: Size(300, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        elevation: 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ))),
      ),
    );
     //End of second screen that appear to the user after clicking زر التحقق
    
    return Scaffold(
        backgroundColor: Color(0xff7D5C77), 
        //body before and after user click the button based on boolean variable that declate at top
        body: circular ? loadBody : myBody
        );
  }

 
//each one Build one of TextField of verification code
  _textFieldOtp(bool first, last, BuildContext context) {
    return Container(
        
      height: 58,
      child: Container(
    
        height: 40,
        width: 55,
        //aspectRatio: 0.7,
        child: TextField(
          obscureText: true,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
             cursorColor: Color(0xff7D5C77),
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(120),
                borderSide: BorderSide(color:Color(0xff7D5C77))),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(120)),
          ),
        ),
      ),
    );
  }
}