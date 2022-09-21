import 'dart:io';

import 'package:image_picker/image_picker.dart';
//when user select date from calendar he will add title and image 
class Event{
   String? title;
   //File? image;
   PickedFile? image;
   Event({this.title,this.image});
   @override
  String toString(){
   return this.title!;
   }
}