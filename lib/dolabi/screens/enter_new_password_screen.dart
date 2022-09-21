
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/screens/login_screen.dart';

class EnterNewPasswordScreen extends StatelessWidget {
  const EnterNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7D5C77),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 4,
          ),
          child: Column(
            children: [
              //App Icon
             Padding(
              padding: EdgeInsets.all(25),
              child:  Image.asset('images/d.png'),
             ),
              SizedBox(
                height: 70,
              ),
              Text('ادخل كلمة المرور الجديدة',
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Colors.white,fontSize: 14))),
                      //Start Of Card Contains Fields
              Padding(
                padding: EdgeInsets.all(11),
                child: Container(
                  height: 300,
                  width: 400,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              LayoutBuilder(
                                builder: (context,constraints){
                                    var h=constraints.maxWidth;
                    return SizedBox(
                      height: 50,
                      width:h-50 ,
                                  child: TextFormField(
                                       cursorColor: Color(0xff7D5C77),
                                    decoration: InputDecoration(
                                        labelText: 'كلمة المرور',
                                        labelStyle: GoogleFonts.cairo(
                                            textStyle:
                                                TextStyle(color: Color(0xff878787))),
                                       // hintStyle: TextStyle(color: Colors.grey),
                                        hintTextDirection: TextDirection.rtl,
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xff7D5C77))),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                  ),
                                );
                                },
                             
                              ),
                              SizedBox(
                                height: 30,
                              ),
                             LayoutBuilder(
                                builder: (context,constraints){
                                   var h=constraints.maxWidth;
                                  return SizedBox(
                                    height:50 ,
                                    width: h-50,
                                  child: TextFormField(
                                       cursorColor: Color(0xff7D5C77),
                                    decoration: InputDecoration(
                                        labelText: ' تأكيد كلمة المرور',
                                        labelStyle: GoogleFonts.cairo(
                                            textStyle:
                                                TextStyle(color: Color(0xff878787))),
                                        hintTextDirection: TextDirection.rtl,
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xff7D5C77))),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                  ),
                                );
                                },
                               
                              ),
                             /* Container(
                                height: 50,
                                width: 300 ,
                                child:  TextFormField(
                                       cursorColor: Color(0xff7D5C77),
                                    decoration: InputDecoration(
                                        labelText: ' تأكيد كلمة المرور',
                                        labelStyle: GoogleFonts.cairo(
                                            textStyle:
                                                TextStyle(color: Color(0xff878787))),
                                        hintTextDirection: TextDirection.rtl,
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xff7D5C77))),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                  ),
                              ),*/
                              SizedBox(
                                height: 30,
                              ),
                              //Start Of Button
                              LayoutBuilder(
                                 builder: (context,constraints){
                                   var h=constraints.maxWidth;
                            return SizedBox(
                               height:50 ,
                                    width: h-50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                    },
                                    child: Text(
                                      'حفظ',
                                      style:
                                          GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xff7D5C77),
                                       // fixedSize: Size(300, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        elevation: 0),
                                  ),
                                );}
                              ),
                              //End Of Button
                            ],
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}