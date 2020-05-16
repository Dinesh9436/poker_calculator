import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poker_calculator/Widgets/animated_button.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:poker_calculator/Widgets/winner_button.dart';
import 'package:poker_calculator/main.dart';
import 'package:poker_calculator/models/player.dart';
import '../Widgets/add_textField.dart';
import 'package:like_button/like_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
 // final GlobalKey<MyHomePageState> _listKey = GlobalKey();

  //List<Widget> playerList =new List() ;
   final list = <Widget>[];
  bool wonBy;
  bool remove = false;
  int count ;
  int gScore = 0;
  TextEditingController playerController = new TextEditingController();
  int tScore = 0;
  VoidCallback onDelete;
  Icon addIcon;
  int sum = 0;
  int rIndex;

  CategoryItem categoryItem;

  MyHomePageState({this.count=1,this.wonBy=false});

  @override
  void initState() {
    super.initState();
    wonBy=false;
    
    setState(() {
       list.add(addPlayer());
    });
     
    

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
  



  Widget addPlayer() {
    return SizedBox(
      height: 40,
      width: 40,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.amber,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add,
              ),
              color: Colors.black,
              onPressed: () {
                int insertIndex = 0;

                var newItem = CategoryItem('Player $count', count
                ,
                    gScore, tScore);

                // Arbitrary location for demonstration purposes

                // Add the item to the data list.
                setState(() {
                  list.add(newItem);

                  //_listKey.currentState.insertItem(insertIndex);
                  
                });
                insertIndex += 1;
                  count += 1;
              },
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/table1.png'), fit: BoxFit.cover)),
        child: Stack(children: <Widget>[
          Center(
            child: Container(
                child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  //crossAxisSpacing: ,
                  mainAxisSpacing: width * 0.1),
              itemBuilder: (BuildContext context, int index) {
               
                
                return  Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.vertical,
                      onDismissed: (direction) {
                        setState(() {
                         list.removeAt(index);
                        });
                      },
                     child: list[index]
                );

                
              },
              
            )),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              
              child: 
                  Icon(Icons.settings_applications, color: Colors.white, size: 50)),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.35,
            child:  Row(
                      
                      children: <Widget>[
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image(
                                image: AssetImage('assets/pokerChips.png'))),
                                Padding(padding: EdgeInsets.all(5)),
                        Text(
                          sum.toString(),
                          style: TextStyle(
                              color: Colors.amberAccent,
                              fontSize: 102,
                              fontWeight: FontWeight.bold),
                        ),
                         Padding(padding: EdgeInsets.all(5)),
                        RaisedButton(
            child: Text('WIN',style: TextStyle(fontSize:32,fontWeight:FontWeight.bold,color:Colors.white),),
            color: Colors.redAccent,
            onPressed: () {
              setState(() {
                wonBy=true;
                remove=true;
              });
                  
                   // tapping the button, starts the animation.
            },
          ),
                      ])),
            
        
        ]),
      ),
    );
  }
}
