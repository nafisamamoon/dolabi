import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/screens/account_screen.dart';
import 'package:travel/dolabi/screens/calendar_screen.dart';
import 'package:travel/dolabi/screens/favorite_screen.dart';
import 'package:travel/dolabi/screens/home_screen.dart';
import 'package:travel/dolabi/screens/matches_screen.dart';

//This Page Build The BottomNavigationBar That Allow Us To Navigate Between Pages
class BottomBarScreen extends StatefulWidget {
  //const BottomBarScreen({Key? key}) : super(key: key);
  String? name;
  bool? gender;
BottomBarScreen({this.name,this.gender});
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _currentIndex = 0;
 
  @override
  Widget build(BuildContext context) {
     List<Widget> _children = [
    // Page Of Application
    HomeScreen(name:widget.name,gender:widget.gender,),
    CalenderScreen(),
    FavoriteScreen(),
    MatchesScreen(),
    AccountScreen()
  ];
    return Scaffold(
        backgroundColor: Colors.white60,
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff7D5C77),
            selectedIconTheme: IconThemeData(color: Color(0xff7D5C77)),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            unselectedLabelStyle: GoogleFonts.cairo(),
            selectedLabelStyle: GoogleFonts.cairo(),
            elevation: 50,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              //Each Item Contain Image And Name
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/home_tab.png',
                  height: 28,
                  width: 29,
                ),
                label: 'الرئيسية',
           //size:14     
           //bold
                activeIcon: Image.asset(
                  'images/home_tab_active.png',
                  height: 28,
                  width: 29,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/calendar_tab.png',
                  height: 28,
                  width: 29,
                ),
                label: 'التقويم',
                activeIcon: Image.asset(
                  'images/calendar_tab_active.png',
                  height: 28,
                  width: 29,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/favorite-tab.png',
                   height: 28,
                  width: 29,
                ),
                label: 'المفضلة',
                activeIcon: Image.asset(
                  'images/favorite_tab_active.png',
                  height: 28,
                  width: 29,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/outfits_tab.png',
                 height: 28,
                  width: 29,
                ),
                label: 'التنسيقات',
                activeIcon: Image.asset(
                  'images/outfits_tab_active.png',
                   height: 28,
                  width: 29,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/account_tab.png',
                height: 28,
                  width: 29,
                ),
                label: 'الحساب',
                activeIcon: Image.asset(
                  'images/account_tab_active.png',
               height: 28,
                  width: 29,
                ),
              ),
            ]));
  }
}