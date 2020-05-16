import 'package:flutter/foundation.dart';

class Player{
  
  List<int> id;
  List<int> gameScore;

  List<int> totalScore;
  List<String> name ;


  Player({
     this.name,
    this.id,this.gameScore,this.totalScore});
  
}