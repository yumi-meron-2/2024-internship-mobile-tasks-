import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MySearchField extends StatefulWidget{
  
  const MySearchField({
    super.key, 
    
  }) ;
  

  @override
  _MySearchFieldState createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField>{

  final TextEditingController _controller = TextEditingController();
  String _inputText = '';

  @override 
  Widget build(BuildContext context){
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
      border: InputBorder.none,
        
      hintText: 'Search',

      suffixIcon:   Padding(padding: const EdgeInsets.all(10),
      child: Icon( Icons.arrow_right_alt,
                    color: Color.fromRGBO(63, 81, 243, 1),
                      ),)
    
        
           
      ),
      onChanged: (text){
        setState((){
          _inputText = text;
          // debugPrint(widget.iswide.toString());
        });
      },
    );
  }
}