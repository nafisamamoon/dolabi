import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/dolabi/model/new_match.dart';
import 'package:travel/dolabi/screens/coordination_data_screen.dart';

class MoveImageScreen extends StatefulWidget {
  //const MoveImageScreen({ Key? key }) : super(key: key);
  List<NewMatch> list=[];
MoveImageScreen({required this.list});
  @override
  State<MoveImageScreen> createState() => _MoveImageScreenState();
}

class _MoveImageScreenState extends State<MoveImageScreen> {
  double left=0.0,top=0.0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
         backgroundColor: Color(0xfff7f7f7),
      //start appBar section
      appBar: AppBar(
        elevation: 0,
        title: Text('قم بتحريك الصور لترتيبها',
            style: GoogleFonts.cairo(
                textStyle: TextStyle(fontSize: 17, color: Color(0xff1a2e35),fontWeight: FontWeight.bold))),
        centerTitle: true,
        backgroundColor:  Color(0xfff7f7f7),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
       //end appBar section
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView(
                  onReorder: (oldIndex,newIndex){
          setState(() {
            if(newIndex>oldIndex) newIndex--;
            final item=widget.list.removeAt(oldIndex);
            widget.list.insert(newIndex, item);
            print('-------------');
            print(widget.list.toString());
          });
                  },
                 children: [
                 for(final item in widget.list)
                 ListTile(
                  key: ValueKey(item),
                  title: Container(
                    height: 200,
                    width: 190,
                    child: Image.asset(item.image!,width: 60,)),
                 )
                 ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: ElevatedButton(
             style: ElevatedButton.styleFrom(
                    primary: Color(0xff7D5C77),
                    fixedSize: Size(257, 56),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CoordinationDataScreen(clothList:widget.list)));
                },
            
             child: Text(
                  'متابعة',
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        
                          fontSize: 18,
                          color: Colors.white))),
             ),
          )
           
        ],
      )
      /*Column(
        children: [
            SizedBox(
            height: height - 300,
          ),
          //start of bottom button
          Padding(
            padding: EdgeInsets.only(left: 70),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff7D5C77),
                    fixedSize: Size(240, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CoordinationDataScreen()));
                },
                child: Text(
                  'متابعة',
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.white)),
                )),
          ),
        ],
      )*/
    );
  }
}
/*
SafeArea(
          child: Stack(
          children: [
          Positioned(
            left:left ,
            top:top,
            child: Expanded(
              child: GestureDetector(
                      onPanUpdate: (details){
                      left=max(0, left+details.delta.dx);
                      top=max(0, top+details.delta.dy);
                      setState(() {
                      
                      },
                      );
                      
                      },
                      onTap: (){
                      
                      },
                      child: ListView.builder(
                       
              itemCount: widget.list.length,
              itemBuilder: (context,i){
                      return Image.asset('${widget.list[i].image}');
              }
              )
                      ),
            ))
          ],
          )),
      */
       