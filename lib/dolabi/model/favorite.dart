import 'dart:io';

class Favorite{
  String? name;
  dynamic image;
  bool isPressed;
  Favorite({this.name,this.image,this.isPressed=false});
  toJson(){
    return {
'name':name,
'image':image
    };
  }
  fromJson(jsonData){
return Favorite(
name: jsonData['name'],
image: jsonData['image']
);
  }
}