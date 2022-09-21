import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/screens/login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Title
                Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'الاعدادات',
                      style: TextStyle(fontSize: 42,color: Color(0xff1a2e35),fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),
              //Start Of Settings List
                _list(
                  'تعديل الحساب',
                  'images/left_arrow.png',
                  'images/edit_account_icon.png',
                ),
                SizedBox(
                  height: 14,
                ),
                _list(
                  'لغة التطبيق',
                  'images/left_arrow.png',
                  'images/language.png',
                ),
                SizedBox(
                  height: 14,
                ),
                _list(
                  'سياسة الخصوصية',
                  'images/left_arrow.png',
                  'images/privacy_tip.png',
                ),
                SizedBox(
                  height: 14,
                ),
                _list(
                  'اتصل بنا',
                  'images/left_arrow.png',
                  'images/call.png',
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  child: _list(
                    'تسجيل الخروج',
                    'images/left_arrow.png',
                    'images/sign_out.png',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'شركاؤنا',
                    style: GoogleFonts.tajawal(
                        textStyle:
                            TextStyle(color:Color(0xffcacaca), fontSize: 29,fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset('images/g.jpg'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'images/instagram_icon.png',
                          width: 36,
                        ),
                        SizedBox(height: 9,),
                        Column(
                          children: [
                            Text(
                              'تابعونا على',
                              style: GoogleFonts.tajawal(
                                  textStyle:
                                      TextStyle(color: Color(0xff989898),fontWeight: FontWeight.bold,fontSize: 12)),
                            ),
                            Text(
                              'انستغرام',
                              style: GoogleFonts.tajawal(
                                  textStyle:
                                      TextStyle(color: Color(0xff989898),fontWeight: FontWeight.bold,fontSize: 12)),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'images/youtube_icon.png',
                          width: 36,
                        ),
                         SizedBox(height: 9,),
                        Column(
                          children: [
                            Text(
                              'تابعونا على',
                              style: GoogleFonts.tajawal(
                                  textStyle:
                                      TextStyle(color: Color(0xff989898),fontWeight: FontWeight.bold,fontSize: 12)),
                            ),
                            Text(
                              'يوتيوب',
                              style: GoogleFonts.tajawal(
                                  textStyle:
                                      TextStyle(color: Color(0xff989898),fontWeight: FontWeight.bold,fontSize: 12)),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
// The Construct List Of Settings Choice
  Widget _list(String text, String backImage, String image) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: ListTile(
        leading: Image.asset(
          image,
          width: 30,
        ),
        title: Text(
          text,
          style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 20,color: Colors.black)),
        ),
        trailing: Image.asset(
          backImage,
          width: 24
        ),
      ),
    );
  }
}
