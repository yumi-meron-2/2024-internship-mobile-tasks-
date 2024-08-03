import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MyTextField extends StatefulWidget{
  final bool iswide;
  final bool dolla;
  final bool isBottom;
  const MyTextField({
    super.key, 
    this.iswide = false,
    this.dolla = false,
    this.isBottom = false,
  }) ;
  

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField>{

  final TextEditingController _controller = TextEditingController();
  String _inputText = '';

  @override 
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(color:Color.fromRGBO(243, 243, 243, 1),),
      child: Column(children: 
          <Widget>[
            TextField(
              
              maxLines: widget.iswide? 4 : 1,
              controller: _controller,
             
              decoration: InputDecoration(
                border: InputBorder.none,
                
             
                suffixIcon: widget.dolla
                ?
                 Padding(padding: const EdgeInsets.only(right: 2,top: 12),
                 child: Text(
                  '\$',
                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black,),
                 ))
                 : null,
                
                   
              ),
              onChanged: (text){
                setState((){
                  _inputText = text;
                  // debugPrint(widget.iswide.toString());
                });
              },
            )
          
          ]
        
        
        ),
    );
  }
}