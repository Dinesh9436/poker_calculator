import 'package:flutter/material.dart';
import 'package:poker_calculator/Widgets/winner_button.dart';
import 'package:poker_calculator/main.dart';
import '../Screens/game.dart';

class CategoryItem extends StatefulWidget {
   int id;
  final String name;
  int playerScore;
  int totalScore;
  


  /*Iterable<String> imageUrl=DUMMY_MEALS.map(
              (catData) =>
                    catData.imageUrl,
                    

                  
            );*/

  CategoryItem(this.name, this.id, this.playerScore, this.totalScore);

  @override
  CategoryItemState createState() => CategoryItemState();
}

class CategoryItemState extends State<CategoryItem> {
  int gameScore1 = 0;
  

  refreshScore(){
    while (widget.id<key.currentState.list.length) {
      if(key.currentState.wonBy=true){
        setState(() {
          widget.playerScore=0;
        });
        
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap:(){
            setState(() {
             
            });
            
          } ,
                  child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.0),
                border: Border.all(
                  color: Colors.blueGrey[100],
                  width: 6.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                  ),
                ]),
            child:CircleAvatar(
                
                radius: 30,
                backgroundImage: AssetImage(
                  'assets/player.png',
                ))

            // Edit Button
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
        key.currentState.wonBy==false?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: SizedBox(
                width: 80,
                height: 20,
                child: TextField(
                  textCapitalization: TextCapitalization.characters,
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration.collapsed(
                      hintText: widget.name,
                      hintStyle: TextStyle(
                        color: Colors.cyanAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(
                      'assets/chip.jpg',
                    )),
                Padding(padding: EdgeInsets.all(5)),
                Text(key.currentState.remove==false?widget.playerScore.toString():gameScore1.toString(),
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    )),
                Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.red,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            
                            setState(() {
                             
                              widget.playerScore += 1;
                              widget.totalScore -= 1;
                              print(widget.id);
                              print(key.currentState.list.length);
                              

                              key.currentState.setState(() {
                                key.currentState.sum += 1;

                              });
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text('Total Score: ' + widget.totalScore.toString(),
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                )),
            Padding(padding: EdgeInsets.all(5)),
          ],
        ):RaisedButton(
            child: Text('WON',style: TextStyle(fontSize:32,fontWeight:FontWeight.bold,color:Colors.white),),
            color: Colors.redAccent,
            onPressed: () {
              setState(() {
              
              widget.playerScore=0;
              key.currentState.setState(() {
              widget.totalScore+=key.currentState.sum;
              key.currentState.sum=0;
              
              
              
              });
              
              
                
                 
                key.currentState.setState(() {key.currentState.wonBy=false;});
                 key.currentState.setState(() {key.currentState.remove=false;});
                 
                
                
               
               
               
            });
            
            
           for (widget.id = 1; widget.id<key.currentState.list.length;widget.id++) {
             widget.playerScore=0;
           }
                  
                   // tapping the button, starts the animation.
            },
          ),
        
      ],
    );
  }
}
