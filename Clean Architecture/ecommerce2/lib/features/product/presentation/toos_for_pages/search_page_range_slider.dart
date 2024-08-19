import 'package:flutter/material.dart';

class RangeSliderWidget extends StatefulWidget{
  @override
  _RangeSliderWidgetState  createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState  extends State<RangeSliderWidget>{
  RangeValues _currentRangeValues = const RangeValues(20,80); 
   @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left:20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RangeSlider(
            values: _currentRangeValues, 
            min: 0, 
            max: 100, 
            divisions: 10,
            activeColor: Color.fromRGBO(63, 81, 243, 1),
            onChanged: 
              (RangeValues values){
                setState((){
                  _currentRangeValues = values;
                });
              },
            ),
          
        ],
      ),
    );
    
    
  }
}