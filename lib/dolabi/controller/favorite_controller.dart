import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/dolabi/model/favorite.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FavoriteController extends GetxController{
  List<Favorite> favoriteList=[];
   SharedPreferences? pref;
   bool load=false;
  setupFav()async{
pref=await SharedPreferences.getInstance();
String? stringFav=pref!.getString('fav');
List favList=jsonDecode(stringFav!);
for(var fav in favList){
 
    favoriteList.add(Favorite().fromJson(fav));
  
  print('//////////////////');
  print(favoriteList.length);
}
}
void saveFav(){
  List items=favoriteList.map((e) => e.toJson()).toList();
  pref!.setString('fav', jsonEncode(items));
}
@override
  void onInit() {
    // TODO: implement onInit
    setupFav();
    
    super.onInit();
  }
}