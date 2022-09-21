
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/screens/login_screen.dart';
import 'package:travel/dolabi/screens/verification_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7D5C77),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
            children: [
              //App Icon
         Padding(
              padding: EdgeInsets.all(25),
              child:  Image.asset('images/d.png'),
             ),
              SizedBox(
                height: 60,
              ),
              Text(
                'ادخل البريد الالكتروني الذي تود استخدام كلمة المرور لة',
                style:
                    GoogleFonts.cairo(textStyle: TextStyle(color: Colors.white,fontSize: 14)),
              ),
              SizedBox(
                height: 10,
              ),
              //Start Of Card Contain Fields
              Container(
                  height: 195,
                  width: 450,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: EdgeInsets.all(17),
                      child: Column(
                        children: [
                          LayoutBuilder(
                            builder: (context,constraints){
                                var h=constraints.maxWidth;
                        return SizedBox(
                        height: 50,
                        width: h-50,
                        child:    TextFormField(
                          cursorColor: Color(0xff7D5C77),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'البريد الالكتروني',
                               //labelStyle:GoogleFonts.cairo(color: Colors.grey),
              labelStyle: TextStyle(fontFamily: 'Cairo',color:Color(0xff878787),fontSize: 16),
                            hintTextDirection: TextDirection.rtl,
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xff7D5C77))),
                               border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                          ),
                       );
                        
                        /*SizedBox(
                          height: 50,
                          width:h-10 ,
                              child: TextFormField(
                                   cursorColor: Color(0xff7D5C77),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    labelText: 'البريد الالكتروني',
                                    labelStyle: GoogleFonts.cairo(),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    hintTextDirection: TextDirection.rtl,
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xff7D5C77))),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50))),
                              ),
                            );*/
                            },
                         
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          // Start Of Button
                          LayoutBuilder(
                                builder: (context,constraints){
                                var h=constraints.maxWidth;
                            return SizedBox(
                                 height: 50,
                        width: h-50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => VerificationScreen()));
                                },
                                child: Text(
                                  'ارسال طلب تغيير كلمة المرور',
                                  style: GoogleFonts.cairo(
                                      textStyle: TextStyle(color: Colors.white,fontSize: 16)),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff7D5C77),
                                  //  fixedSize: Size(300, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    elevation: 0),
                              ),
                            );}
                          ),
                          // End Of Button
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'الرجوع الى صفحة تسجيل الدخول',
                              style: GoogleFonts.cairo(
                                  textStyle: TextStyle(color: Colors.black,fontSize: 14)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  //End Of Card Contain Fields
            ],
                  ),
                ),
          )),
    );
  }
}