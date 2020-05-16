import 'package:flutter/material.dart';

class AnimatingButton extends StatefulWidget {
  String text;

  AnimatingButton(this.text);
  @override
  AnimatingButtonState createState() {
    return new AnimatingButtonState();
  }
}

class AnimatingButtonState extends State<AnimatingButton>
    with SingleTickerProviderStateMixin {
  //Uses a Ticker Mixin for Animations
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                1)); //specify the duration for the animation & include `this` for the vsyc
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
        _animationController); //use Tween animation here, to animate between the values of 1.0 & 2.5.

    _animation.addListener(() {
      //here, a listener that rebuilds our widget tree when animation.value chnages
      setState(() {});
    });

    _animation.addStatusListener((status) {
      //AnimationStatus gives the current status of our animation, we want to go back to its previous state after completing its animation
      if (status == AnimationStatus.completed) {
        _animationController
            .reverse(); //reverse the animation back here if its completed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  ButtonTheme(
          minWidth: 66.0 *
              _animation
                  .value, //multiply the static width value with current animation.value value
          height: 27.0 *
              _animation
                  .value, //multiply the static height value with current animation.value value
          child: RaisedButton(
            child: Text(widget.text,style: TextStyle(fontSize:32,fontWeight:FontWeight.bold,color:Colors.white),),
            color: Colors.redAccent,
            onPressed: () {
              _animationController
                  .fling();
                  
                   // tapping the button, starts the animation.
            },
          ),
        );
  }
}