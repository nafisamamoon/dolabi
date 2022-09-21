import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel/dolabi/controller/favorite_controller.dart';
import 'package:travel/dolabi/model/category_item.dart';
import 'package:travel/dolabi/model/favorite.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CategoryScreen extends StatefulWidget {
  //const CategoryScreen({ Key? key }) : super(key: key);
  String? name, image;
  CategoryScreen({this.name, this.image});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  
  int m=0;
  SharedPreferences? pref;
  bool circular = false;
  //list of new outfits added by user
  List<CategoryItem> myList = [];
  List<Favorite> favoriteList=[];
  //hold name of outfit added by user
  TextEditingController title = TextEditingController();
  FavoriteController controller=Get.put(FavoriteController());
  final ImagePicker _picker=ImagePicker();
  File? image;
  final imagePicker = ImagePicker();
  bool favChange=false;
    GlobalKey<FormState> _formkey=GlobalKey<FormState>();
// For Upload Image From Gallery
  uploadImage() async {
    var pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else {}
  }
 void initState(){
super.initState();
setupFav();
  }
setupFav()async{
pref=await SharedPreferences.getInstance();
String? stringFav=pref!.getString('fav');
List favList=jsonDecode(stringFav!);
for(var fav in favList){
  setState(() {
    favoriteList.add(Favorite().fromJson(fav));
  });
  print('//////////////////');
  print(favoriteList.length);
}
}
void saveFav(){
  favChange=true;
 setState(() {
   
 });
  List items=favoriteList.map((e) => e.toJson()).toList();
  print(items);
  pref!.setString('fav', jsonEncode(items));
}

PickedFile? _imageFile;

  @override
  Widget build(BuildContext context) {
      var _crossAxisiSpacing= 11.0,_mainAxisiSpacing=20.0,_aspectRaito=0.6;
    int _crossAxsisCount=2;
      double _screenWidyh=MediaQuery.of(context).size.width;
       var wid=(_screenWidyh-((_crossAxsisCount-1)*_crossAxisiSpacing)) /_crossAxsisCount;
       var cellHig=270;
       var _asp=wid/cellHig;
    // var width=MediaQuery.of(context).size.width;
      var hig=MediaQuery.of(context).size.height;
    return myList.isNotEmpty?Scaffold(
         backgroundColor: Color(0xfff7f7f7),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(19),
        child: Column(
          children: [
            //start name and image of the category
            Container(
              height: 100,
              width: 100,
              child: Image.asset(widget.image!),
            ),
            Text(widget.name!,
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(color: Colors.grey[600]))),
                     //end name and image of the category
                     //start GridView of outfits added by user
            GetBuilder<FavoriteController>(
              builder: (controller) {
                return Expanded(
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 9,
                       // childAspectRatio: 0.7,
                       childAspectRatio: _asp,
                        crossAxisSpacing: 11),
                    itemCount: myList.length,
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
                         Container(
                              height: 170,
                              width: 380,
                         
                              child: ClipRRect(
             borderRadius:BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),                 
                                child:  Image.file(
                                 File( myList[i].image!.path),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 6,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
//SizedBox(height: 4,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
 Text(
                                          '${myList[i].name}',
                                        style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                              color: Color(0xff1a2e35),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                      ),
 
                                     GestureDetector(
                                  onTap: () {
            favoriteList.add(Favorite(
              name: myList[i].name,
            
             image: myList[i].image!.path,
             
            isPressed: true,
            
            ));
setState(() {
  
});
            
           saveFav();
           controller.load=true;
           print(controller.load);
         
                                  },
                                  child:Image.asset(
                                    'images/ge.png',
                                    width: 25,
                                  ),
                                )
  ],
)
                                ],
                              ),
                            )
              ,   

                      ],
                    ),
                  ),
                          );
                      ////////////////////////////////
                       Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        elevation: 4,
                        child: Column(
                          children: [
                            //Start image container
                            Container(
                             // height: 180,
                              //width: 300,
                               height: 160,
                                        width: 199,
                              child: ClipRRect(
                                   borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),
                                child: Image.file(
                                 File( myList[i].image!.path),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Text(
                                    '${myList[i].name}',
                                    style: GoogleFonts.cairo(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
            favoriteList.add(Favorite(
              name: myList[i].name,
            
             image: myList[i].image!.path,
             
            isPressed: true,
            
            ));
setState(() {
  
});
            
           saveFav();
           controller.load=true;
           print(controller.load);
         
                                  },
                                  child:Image.asset(
                                    'images/favorite-tab.png',
                                    width: 25,
                                  ),
                                )
                              ],
                            ))
                           
                          ],
                        ),
                      );
                    }),
              );
              },
              
            )
              //end GridView of outfits added by user
          ],
        ),
      )),
      //start button to add new outfit by user
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: _screenWidyh/2),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xff7D5C77),
              fixedSize: Size(150, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              elevation: 0),
          onPressed: () {
            //start bottom sheet to add image and name of the outfit
          
              _imageFile=null;
                                  
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context,setStatee){
                      return Container(
                      height:340,
                      child: Container(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                         
                                GestureDetector(
      onTap: (){
        showModalBottomSheet(context: context, builder: (builder){
          return  Container(
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
              onPressed: ()async{
                  final pickedFile=await _picker.getImage(source: ImageSource.camera);
   
  
     
   setStatee(() {
      
   _imageFile=pickedFile;

    });
              },
               icon: Icon(Icons.camera,color:Color(0xff7D5C77) ,), 
               label: Text('الكاميرا',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14))
               )
               ),
            FlatButton.icon(
              onPressed: ()async{
                   final pickedFile=await _picker.getImage(source: ImageSource.gallery);
   
 
     
   setStatee(() {
      
   _imageFile=pickedFile;

    });
              },
               icon: Icon(Icons.image,color: Color(0xff7D5C77),), 
               label: Text('الاستوديو',style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14)),)
               ),
            
           
          ],)
          
        ],
      ),
    );
        });
      },
      child: Container(
        height:170 ,
        width:133 ,
        child: CircleAvatar(
          radius:80,
          backgroundImage:_imageFile == null?AssetImage('images/add_cloth_image.png') :FileImage(File(_imageFile!.path)) as ImageProvider ,
        ),
      ),
      ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 367,
                                height: 51,
                              child:TextFormField(
                                /*  validator: (text){
                                    if(text!.isEmpty){
                                      return 'ادخل هذا الحقل';
                                    }
                                    return null;
                                  },*/
                                controller: title,
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'الوصف',
                                    hintStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14,fontFamily:'Tajawal-Medium'),
                                    fillColor: Color(0xfff2f2f7),
                                    border: InputBorder.none),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff7D5C77),
                                      fixedSize: Size(257, 56),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 0),
                                  onPressed: () {
                                    print('**********');
                                    print(title.text);
                                    print(_imageFile);
                                    var formData=_formkey.currentState;
                          if(title.text !='' && _imageFile != null){
print('============================');
                                    myList.add(CategoryItem(
                                        name: title.text, image: _imageFile));
                                    circular = true;
                                    title.clear();
                                    Navigator.pop(context);
                        circular=false;
                                    setState(() {});
                                    print('////////////////');
                                    print(myList.length);
                                    print(myList[0]);
                          }
                                    
                                  },
                                  child: circular
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'حفظ',
                                          style: GoogleFonts.cairo(
                                              textStyle: TextStyle(
                                                
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ))
                            ],
                          ),
                        ),
                        
                      ));
                    }
                    );
                 /* Container(
                      height: 400,
                      child: Container(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                           /*   GestureDetector(
                                  onTap: () {
                                    uploadImage();
                                  },
                                  child: Image.asset(
                                    'images/add_cloth_image.png',
                                    width: 136,
                                  )),*/
                                  imageProfile(),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 367,
                                height: 51,
                              child:TextFormField(
                                /*  validator: (text){
                                    if(text!.isEmpty){
                                      return 'ادخل هذا الحقل';
                                    }
                                    return null;
                                  },*/
                                controller: title,
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'الوصف',
                                    hintStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14),
                                    fillColor: Color(0xfff2f2f7),
                                    border: InputBorder.none),
                              )),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff7D5C77),
                                      fixedSize: Size(257, 56),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 0),
                                  onPressed: () {
                                    var formData=_formkey.currentState;
                          if(title.text !='' && _imageFile != null){
print('============================');
                                    myList.add(CategoryItem(
                                        name: title.text, image: _imageFile));
                                    circular = true;
                                    title.clear();
                                    Navigator.pop(context);
                        circular=false;
                                    setState(() {});
                                    print('////////////////');
                                    print(myList.length);
                                    print(myList[0]);
                          }
                                    
                                  },
                                  child: circular
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'حفظ',
                                          style: GoogleFonts.cairo(
                                              textStyle: TextStyle(
                                                
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ))
                            ],
                          ),
                        ),
                      ));*/
                });
                 //end bottom sheet to add image and name of the outfit
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              SizedBox(
                width: 9,
              ),
              Text(
                'اضافة عنصر',
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
      //end button to add new outfit by user
    ) : Scaffold(
         backgroundColor: Color(0xfff7f7f7),
body:SafeArea(child: Padding(
  padding: const EdgeInsets.all(25),
  child:   SingleChildScrollView(
    child: Column(
    
      children: [
    
             Container(
    
                  height: 55,
    
                  width:55,
    
                  child: Image.asset(widget.image!),
    
                ),
    
                Text(widget.name!,
    
                    style: GoogleFonts.cairo(
    
                        textStyle: TextStyle(color:Color(0xff1a2e35),fontSize: 17,fontWeight: FontWeight.bold))),
    SizedBox(height: 140,),
     Center(child: Image.asset('images/j.jpg',width: 332,height: 248,)),
     SizedBox(height: 20,),
     Text('لا يوجد لديك ملابس في هذا القسم',style: GoogleFonts.cairo(
                            textStyle: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1a2e35),fontSize: 17))),
  
      SizedBox(height: 15,),
       Container(
        //  padding: EdgeInsets.only(left: _screenWidyh/2),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xff7D5C77),
                fixedSize: Size(150, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 0),
            onPressed: () {
              //start bottom sheet to add image and name of the outfit
               showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context,setStatee){
                      return Container(
                      height: 340,
                      child: Container(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                         
                                GestureDetector(
      onTap: (){
        showModalBottomSheet(context: context, builder: (builder){
          return  Container(
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
              onPressed: ()async{
                  final pickedFile=await _picker.getImage(source: ImageSource.camera);
   
  
     
   setStatee(() {
      
   _imageFile=pickedFile;

    });
              },
               icon: Icon(Icons.camera,color:Color(0xff7D5C77) ,), 
               label: Text('الكاميرا',style:  GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14))
               )
               ),
            FlatButton.icon(
              onPressed: ()async{
                   final pickedFile=await _picker.getImage(source: ImageSource.gallery);
   
 
     
   setStatee(() {
      
   _imageFile=pickedFile;

    });
              },
               icon: Icon(Icons.image,color: Color(0xff7D5C77),), 
               label: Text('الاستوديو',style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14)),)
               ),
            
           
          ],)
          
        ],
      ),
    );
        });
      },
      child: Container(
        height:170 ,
        width:133 ,
        child: CircleAvatar(
          radius:20,
          backgroundImage:_imageFile == null?AssetImage('images/add_cloth_image.png') :FileImage(File(_imageFile!.path)) as ImageProvider ,
        ),
      ),
      ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 367,
                                height: 51,
                              child:TextFormField(
                                /*  validator: (text){
                                    if(text!.isEmpty){
                                      return 'ادخل هذا الحقل';
                                    }
                                    return null;
                                  },*/
                                controller: title,
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'الوصف',
                                    hintStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14,fontFamily:'Tajawal'),
                                    fillColor: Color(0xfff2f2f7),
                                    border: InputBorder.none),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff7D5C77),
                                      fixedSize: Size(257, 56),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 0),
                                  onPressed: () {
                                    print('**********');
                                    print(title.text);
                                    print(_imageFile);
                                    var formData=_formkey.currentState;
                          if(title.text !='' && _imageFile != null){
print('============================');
                                    myList.add(CategoryItem(
                                        name: title.text, image: _imageFile));
                                    circular = true;
                                    title.clear();
                                    Navigator.pop(context);
                        circular=false;
                                    setState(() {});
                                    print('////////////////');
                                    print(myList.length);
                                    print(myList[0]);
                          }
                                    
                                  },
                                  child: circular
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'حفظ',
                                          style: GoogleFonts.cairo(
                                              textStyle: TextStyle(
                                                
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ))
                            ],
                          ),
                        ),
                        
                      ));
                    }
                    );
                 /* Container(
                      height: 400,
                      child: Container(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                           /*   GestureDetector(
                                  onTap: () {
                                    uploadImage();
                                  },
                                  child: Image.asset(
                                    'images/add_cloth_image.png',
                                    width: 136,
                                  )),*/
                                  imageProfile(),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 367,
                                height: 51,
                              child:TextFormField(
                                /*  validator: (text){
                                    if(text!.isEmpty){
                                      return 'ادخل هذا الحقل';
                                    }
                                    return null;
                                  },*/
                                controller: title,
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'الوصف',
                                    hintStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14),
                                    fillColor: Color(0xfff2f2f7),
                                    border: InputBorder.none),
                              )),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff7D5C77),
                                      fixedSize: Size(257, 56),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 0),
                                  onPressed: () {
                                    var formData=_formkey.currentState;
                          if(title.text !='' && _imageFile != null){
print('============================');
                                    myList.add(CategoryItem(
                                        name: title.text, image: _imageFile));
                                    circular = true;
                                    title.clear();
                                    Navigator.pop(context);
                        circular=false;
                                    setState(() {});
                                    print('////////////////');
                                    print(myList.length);
                                    print(myList[0]);
                          }
                                    
                                  },
                                  child: circular
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'حفظ',
                                          style: GoogleFonts.cairo(
                                              textStyle: TextStyle(
                                                
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ))
                            ],
                          ),
                        ),
                      ));*/
                });
          //   nn();
           

                   //end bottom sheet to add image and name of the outfit
            },
            child: Row(
              children: [
                Icon(Icons.add),
                SizedBox(
                  width: 9,
                ),
                Text(
                  'اضافة عنصر',
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),                 
    
      ],
    
    ),
  ),
)),
//floatingActionButton: 
    );
  }
  Widget imageProfile(){
    return GestureDetector(
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
    );
   /* return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
              backgroundImage:_imageFile == null?AssetImage('images/add_cloth_image.png') :FileImage(File(_imageFile!.path)) as ImageProvider ,
          ),
          Positioned(child: InkWell(
            onTap:(){
              showModalBottomSheet(context: context, builder:((builder)=>bottomsheet()));
            },
            child: Icon(Icons.camera),
            
          ),
          bottom: 20,
          right:20
          )
        ],
      ),
    );*/
  }
  Widget bottomsheet(){
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
  }
  void takePhoto(ImageSource source)async{
    final pickedFile=await _picker.getImage(source: source);
   
   _imageFile=pickedFile;
     
   setState(() {
      
 

    });
  
  }
  nn(){
    return   showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Container(
                          height: 400,
                          child: Container(
                            child: Form(
                              key:   _formkey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                /*  GestureDetector(
                                      onTap: () {
                                        uploadImage();
                                      },
                                      child: Image.asset(
                                        'images/add_cloth_image.png',
                                       width: 136,
                                      )),*/
                                  imageProfile(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                     width: 367,
                                    height: 51,
                                    child: TextFormField(
                                       /* validator: (text){
                                  if(text!.isEmpty){
                                    return 'ادخل هذا الحقل';
                                  }
                                  return null;
                                },*/
                                      controller: title,
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText: 'الوصف',
                                          hintStyle: TextStyle(color: Color(0xff1a2e35),fontSize: 14),
                                          fillColor:  Color(0xfff2f2f7),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xff7D5C77),
                                          fixedSize: Size(240, 60),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          elevation: 0),
                                      onPressed: () {
                                        //var formData=_formkey.currentState;
                          if(title.text !='' && _imageFile != null){
                            myList.add(CategoryItem(
                                            name: title.text, image: _imageFile));
                                        circular = true;
                                        title.clear();
                                        Navigator.pop(context);
                                                circular=false;
                                        setState(() {});
                                        print('////////////////');
                                        print(myList.length);
                                        print(myList[0]);
                          }
                                      
                                      },
                                      child: circular
                                          ? CircularProgressIndicator()
                                          : Text(
                                              'حفظ',
                                              style: GoogleFonts.cairo(
                                                  textStyle: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 19,
                                                      color: Colors.white)),
                                            ))
                                ],
                              ),
                            ),
                          )),
                    );
                  });
  }
}
