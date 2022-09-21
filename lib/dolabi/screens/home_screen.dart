
/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/screens/category_screen.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);
String? name;
bool? gender;
HomeScreen({this.name,this.gender});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.all(19),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                'مرحبا ${widget.name}',
                style: GoogleFonts.cairo(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 42)),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                'تصفح خزانة ملابسك حسب الفئة',
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(color: Colors.grey[600])),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: block(
                      'الملابس العلوية', 'images/male_upper_category.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: block(
                      'الملابس السفلية', 'images/female_lower_category.png'),
                ),
              ],
            ),
            //Block Is Method Build Each Category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: block('الشنط', 'images/male_bags_category.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child:
                      block('البدل الرسمية', 'images/male_formal_category.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: block('أحذية وصنادل', 'images/shoes_cateogry.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: block('اكسسوارات', 'images/accessories_category.png'),
                ),
              ],
            ),
            Center(
              child: block('اهداء', 'images/gifts_category.png'),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                'اخر التنسيقات',
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            //Start Of Horizontal List 
            Container(
              height: 290,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, i) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 300,
                            child: Image.asset(
                              'images/images.jfif',
                              fit: BoxFit.fill,
                            ),
                          ),
                         Padding(padding: EdgeInsets.only(right: 9),
                         child:  Text(
                            '16/5/2020',
                            style: GoogleFonts.cairo(
                                textStyle: TextStyle(color: Colors.grey[600])),
                          ),
                         ),
                       Padding(padding:EdgeInsets.only(right: 9) ,
                       child:    Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'تنسيقة اخر الأسبوع',
                                style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            Padding(padding:EdgeInsets.only(right: 98) ,
                            child:   Image.asset(
                                'images/share.png',
                                width: 20,
                              ),
                            )
                            ],
                          ),
                       )
                        ],
                      ),
                    );

                  }),
            )
             //End Of Horizontal List 
          ],
        ),
      ))),
    );
  }
// Build Each Category by using text and image
  block(String text, String image) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen(
          name: text,
          image: image,
        )));
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 200,
            color: Colors.transparent,
          ),
          Positioned(
            bottom: 10,
            child: Container(
              height: 80,
              width: 180,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  text,
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 43,
            right: 10,
            //  width: 150,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              maxRadius: 37,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/screens/category_screen.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);
String? name;
bool? gender;
HomeScreen({this.name,this.gender});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('///////////');
    print(widget.gender);
    return Scaffold(
         backgroundColor: Color(0xfff7f7f7),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.all(19),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                'مرحبا ${widget.name}',
                style: GoogleFonts.cairo(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 42,color: Color(0xff1a2e35))),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                'تصفح خزانة ملابسك حسب الفئة',
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 16)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
           
         specifyGender(),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                'اخر التنسيقات',
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1a2e35),fontSize: 20)),
              ),
            ),
            //Start Of Horizontal List 
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context,i){
                return Padding(padding:EdgeInsets.symmetric(vertical: 15,horizontal:5) ,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Container(
                    width: 200,
                    height: 270,
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
                            height: 200,
                            width: 380,
                         
                            child: Image.asset(
                              'images/images.jfif',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
   Text(
                            '16/5/2020',
                        style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff707070),fontSize: 16))),
SizedBox(height: 4,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
Text(
                            'تنسيقة اخر الأسبوع',
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
              },),
            )
        
             //End Of Horizontal List 
          ],
        ),
      ))),
    );
  }
// Build Each Category by using text and image
  block(String text, String image) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen(
          name: text,
          image: image,
        )));
      },
      child:  Stack(
          children: [
            Container(
            height: 130,
            
              width: 200,
              color: Colors.transparent,
            ),
            Positioned(
              bottom: 10,
              child: Container(
                height: 80,
                width: 180,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    border: Border.all(color: Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(7)),
                child: LayoutBuilder(
                  builder: (context,constraints){
                  var  h=constraints.maxHeight;
                  var w=constraints.maxWidth;
                    return Padding(
                    //
                    padding: EdgeInsets.only(bottom: 8, left:w-130),
                    child: Text(
                      text,
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15)),
                    ),
                  );
                  },
                 
                ),
              ),
            ),
            Positioned(
              bottom: 43,
              right: 10,
              //  width: 150,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                maxRadius: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
            )
          ],
        )
        
    );
  }
  specifyGender(){
    if(widget.gender == true){
      print('female');
      print('yes');
     return Column(
      children: [
         Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: block(
                      'الملابس العلوية', 'images/female_upper_category.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: block(
                      'الملابس السفلية', 'images/female_lower_category.png'),
                ),
              ],
            ),
            //Block Is Method Build Each Category
            SizedBox(height: 0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: block('الشنط', 'images/female_bags_category.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child:
                      block('الفساتين', 'images/female_dresses_category.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: block('أحذية وصنادل', 'images/shoes_cateogry.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: block('اكسسوارات', 'images/accessories_category.png'),
                ),
              ],
            ),
            Center(
              child: block('اهداء', 'images/gifts_category.png'),
            )
      ],
     );
    }else if(widget.gender == false){
      print('male');
        print('no');
      return Column(
      children: [
         Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: block(
                      'الملابس العلوية', 'images/male_upper_category.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: block(
                      'الملابس السفلية', 'images/female_lower_category.png'),
                ),
              ],
            ),
            //Block Is Method Build Each Category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: block('الشنط', 'images/male_bags_category.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child:
                      block('البدل الرسمية', 'images/male_formal_category.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: block('أحذية وصنادل', 'images/shoes_cateogry.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: block('اكسسوارات', 'images/accessories_category.png'),
                ),
              ],
            ),
            Center(
              child: block('اهداء', 'images/gifts_category.png'),
            )
      ],
     );
    }
  }
}
/*
block(String text, String image) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen(
          name: text,
          image: image,
        )));
      },
      child: LayoutBuilder(
        builder: (context,constraints){
          var w=constraints.maxWidth;
var h=constraints.maxHeight;
          return Stack(
          children: [
            Container(
            height: 130,
            
              width: 200,
              color: Colors.transparent,
            ),
            Positioned(
              bottom: 10,
              child: Container(
                height: 80,
                width: 180,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    border: Border.all(color: Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(7)),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8, left: w/7),
                  child: Text(
                    text,
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 43,
              right: 10,
              //  width: 150,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                maxRadius: 37,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
            )
          ],
        );
        },
       
      ),
    );
  }
*/
/*
 Container(
              height: 290,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, i) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 300,
                            child: Image.asset(
                              'images/images.jfif',
                              fit: BoxFit.fill,
                            ),
                          ),
                         Padding(padding: EdgeInsets.only(right: 9),
                         child:  Text(
                            '16/5/2020',
                            style: GoogleFonts.cairo(
                                textStyle: TextStyle(color: Colors.grey[600])),
                          ),
                         ),
                       Padding(padding:EdgeInsets.only(right: 9) ,
                       child:    Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'تنسيقة اخر الأسبوع',
                                style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            Padding(padding:EdgeInsets.only(right: 98) ,
                            child:   Image.asset(
                                'images/share.png',
                                width: 20,
                              ),
                            )
                            ],
                          ),
                       )
                        ],
                      ),
                    );

                  }),
            )
*/