
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/dolabi/screens/bottom_bar_screen.dart';
import 'package:travel/dolabi/screens/forget_password_screen.dart';
import 'package:travel/dolabi/screens/specify_gender_screen.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({ Key? key }) : super(key: key);
  
  var height, width;
  @override
  Widget build(BuildContext context) {
  var width=MediaQuery.of(context).size.width;
var high=MediaQuery.of(context).size.height;
    return Scaffold(
      //App Background color
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
                height: 20,
              ),
              Text(
                'قم بالتسجيل للمتابعة',
                style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14),
              ),
              //Start of card
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 450,
                  width: 400,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: EdgeInsets.all(17),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          //Start Email feild
                          LayoutBuilder(
                            builder:(context,constraints){
                              var h=constraints.maxWidth;
                              return  SizedBox(
                        height: 50,
                        width: h-50,
                        child:    TextFormField(
                          cursorColor: Color(0xff7D5C77),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'البريد الالكتروني',
                               //labelStyle:GoogleFonts.cairo(color: Colors.grey),
              labelStyle: TextStyle(fontFamily: 'Cairo',color: Color(0xffafafaf),fontWeight: FontWeight.w700,fontSize: 16),
                            hintTextDirection: TextDirection.rtl,
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xff7D5C77))),
                               border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                          ),
                       )
                          ;
                            }
                            ),
                       //End Email feild
                          SizedBox(
                            height: 25,
                          ),
                          //Start Password field
                          LayoutBuilder(
                            builder: (context,constraints){
                              var h=constraints.maxWidth;
                              return  SizedBox(
                                width: h-50,
                                height: 50,
                                child: TextFormField(
                                  cursorColor: Color(0xff7D5C77),
                          obscureText:true,
                            decoration: InputDecoration(
                                hintText: 'كلمة المرور',
                                //hintStyle: GoogleFonts.cairo(color: Colors.grey),
                                hintStyle:  TextStyle(fontFamily: 'Cairo',color: Color(0xffafafaf),fontSize: 16,fontWeight: FontWeight.w700),
                                hintTextDirection: TextDirection.rtl,
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xff7D5C77))),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                              );
                            }
                            ),
                         
                            //End Password field
                          SizedBox(
                            height: 30,
                          ),
                          //Start of login Button
                          LayoutBuilder(
                            builder: (context,constraints){
                              var h=constraints.maxWidth;
                              return SizedBox(
                                  height: 50,
                        width: h-50,
                              child: ElevatedButton(
                                onPressed: ()async {
                                  SharedPreferences pref=await SharedPreferences.getInstance();
                            pref.clear();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SpecifyGenderScreen()));
                                },
                                child: Text(
                                  'تسجيل',
                                 // style: GoogleFonts.cairo(textStyle: TextStyle()),
                                 style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff7D5C77),
                                    fixedSize: Size(300, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    elevation: 0),
                              ),
                            );
                            }
                           
                          ),
                            //End of login Button
                          Container(
                          //  padding: EdgeInsets.only(left: 190, top: 30),
                            padding: EdgeInsets.only(left: width/2, top: 30),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ForgetPasswordScreen()));
                                },
                                child: Text(
                                  'نسيت كلمة المرور؟',
                                /*  style: GoogleFonts.cairo(
                                      textStyle:
                                          TextStyle(color: Colors.amber[600])),*/
                                          style: TextStyle(fontFamily: 'Cairo',color: Color(0xffffb678),fontWeight: FontWeight.w700,fontSize: 14),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              'أو سجل الدخول باستخدام',
                              //style: GoogleFonts.cairo(),
                              style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.w700,color:Color(0xff9d9d9d),fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //start of social media icon section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                         GestureDetector(
                            onTap:(){
                              //execute code when click on icon
                            },
                          child:  Container(
                        
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                 
                                  border:
                                      Border.all(color: Colors.grey.shade100),
                               
                                ),
                                child: Image.asset(
                                  'images/facebook.png',
                                ),
                              )),
                              SizedBox(
                                width: 50,
                              ),
                              GestureDetector(
                                onTap: (){
                                   //execute code when click on icon
                                },
                           child:   Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  //color: Colors.red,
                                  border:
                                      Border.all(color: Colors.grey.shade100),
                               
                                ),
                                child: Image.asset(
                                  'images/gmail.png',
                                ),
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(right: 40),
                  child: Row(
                    children: [
                      Text(
                        'عبر تسجيل الدخول انت توافق على',
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,fontSize: 12)),
                      ),
                      Text(
                        'سياسات التطبيق',
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xfffd8c00),fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
