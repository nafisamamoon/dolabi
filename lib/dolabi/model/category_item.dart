import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CategoryItem{
  String? name;
 // File? image;
 PickedFile? image;
  bool? gender;
  CategoryItem({this.name,this.image,this.gender});
}