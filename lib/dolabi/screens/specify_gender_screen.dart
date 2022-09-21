
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/screens/bottom_bar_screen.dart';
import 'package:travel/dolabi/screens/login_screen.dart';
import 'package:travel/dolabi/screens/verification_screen.dart';

class SpecifyGenderScreen extends StatefulWidget {
  const SpecifyGenderScreen({Key? key}) : super(key: key);

  @override
  State<SpecifyGenderScreen> createState() => _SpecifyGenderScreenState();
}

class _SpecifyGenderScreenState extends State<SpecifyGenderScreen> {
  TextEditingController name=TextEditingController();
  bool gender=true;
  bool _isPressed=false;
  bool _isPressed1=false;
  GlobalKey<FormState> _formkey=GlobalKey<FormState>();
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
              //App icon
               Padding(
              padding: EdgeInsets.all(25),
              child:  Image.asset('images/d.png'),
             ),
              SizedBox(
                height: 15,
              ),
              Text(
                'احتاج فقط الى',
                style:
                    GoogleFonts.cairo(textStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 10,
              ),
              //Start of card contains feild,images and button
              Container(
                  height: 390,
                  width: 450,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: EdgeInsets.all(17),
                      child: Column(
                        children: [
                          //Start of name textField
                          Form(
                            key: _formkey,
                            child: Container(
                              height: 50,
                              width: 300,
                              child: TextFormField(
                                 /*validator: (text){
                                        if(text!.isEmpty){
                                          return 'ادخل هذا الحقل';
                                        }
                                        return null;
                                      },*/
                                                       controller: name,
                                cursorColor: Color(0xff7D5C77),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                               // helperText: 'ادخل الحقل',
                                    labelText: 'الاسم',
                                     //labelStyle:GoogleFonts.cairo(color: Colors.grey),
              labelStyle: TextStyle(fontFamily: 'Cairo',color: Color(0xffafafaf),fontWeight: FontWeight.w700,fontSize: 16),
                                  hintTextDirection: TextDirection.rtl,
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xff7D5C77))),
                                     border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                                ),
                            )
                          
                             
                          ),
                          //End of name textField
                          SizedBox(
                            height: 20,
                          ),
                          //Start of gender image
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             /* InkWell(
                                onTap: (){
                                setState(() {
                               _isPressed=false;
                                    _isPressed1=true;
                                   gender=true;
                                  });   
                                },
                                child: Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        color:_isPressed1? Colors.grey[400] : Colors.transparent,
                                                      border: Border.all(color: Colors.grey.shade100),
                                                      borderRadius: BorderRadius.circular(7) 
                                      ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            gender=true;
                                            print(gender);
                                          });
                                        },
                                        child: Icon(Icons.female,size: 90,),
                                       // child: Image.asset('images/gender-female.png')
                                        ),
                                        Text('انثى',
                                  style: GoogleFonts.cairo(textStyle: TextStyle()))
                                    ],
                                  ),
                                ),
                              ),*/
                         GestureDetector(
                          onTap: (){
                              setState(() {
                                            gender=true;
                                            print(gender);
                                            _isPressed=false;
                                            _isPressed1=true;

                                          });
                          },
                          child: Container(
                             decoration: BoxDecoration(
                                        color:_isPressed1? Colors.grey[400] : Colors.transparent,
                                                      border: Border.all(color: Colors.grey.shade100),
                                                      borderRadius: BorderRadius.circular(7) 
                                      ),
                            child: Column(
                              children: [
                                Icon(Icons.female,size: 90,),
                                 Text('انثى',
                                    style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16,color: Colors.black)))
                              ],
                            ),
                          ),
                         ) ,   
                             /*Column(
                               children: [
                                 GestureDetector(
                                   onTap: (){
                                   setState(() {
                                       gender=false;
                                        print(gender);
                                   });
                                   },
                                      child: Icon(Icons.male,size: 90,),
                                //   child: Image.asset('images/gender_male.png')
                                   ),
                                   Text('ذكر',
                             style: GoogleFonts.cairo(textStyle: TextStyle()))
                               ],
                             ),*/
                             GestureDetector(
                                onTap: (){
                                   setState(() {
                                       gender=false;
                                        print(gender);
                                        _isPressed1=false;
                                        _isPressed=true;
                                   });
                                   },
                                   child: Container(
                                      decoration: BoxDecoration(
                                        color:_isPressed? Colors.grey[400] : Colors.transparent,
                                                      border: Border.all(color: Colors.grey.shade100),
                                                      borderRadius: BorderRadius.circular(7) 
                                      ),
                                     child: Column(
                                      children: [
                                        Icon(Icons.male,size: 90,),
                                     Text('ذكر',
                             style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16,color:Colors.black)))      
                                      ],
                                     ),
                                   ),
                             )
                            ],
                          ),
                          //End of Gender image
                          SizedBox(
                            height: 50,
                          ),
                          //Start of button
                          ElevatedButton(
                            onPressed: () {
                         // var formData=_formkey.currentState;
                        
                          if(name.text != ''){
                           
  Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BottomBarScreen(name: name.text,gender: gender,)));
                          }
                            
                            },
                            child: Text(
                              'متابعة',
                              style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff7D5C77),
                                fixedSize: Size(300, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                elevation: 0),
                          ),
                          //End od button
                        ],
                      ),
                    ),
                  )),
                   //End of card contains feild,images and button
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VerificationScreen()));
                },
                child: Text(
                  'دولابي v.1.0',
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold,fontSize:14)),
                ),
              ),
            ],
                  ),
                ),
          )),
    );
  }
}