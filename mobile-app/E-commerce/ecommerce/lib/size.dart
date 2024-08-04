import 'package:flutter/material.dart';
import 'dart:ui';


class ShoeSize extends StatelessWidget {
  final int shoeSize;
  final bool isSelected;
  final VoidCallback onTap;
  
  ShoeSize({
    Key? key,
    required this.shoeSize,
    required this.isSelected,
    required this.onTap,
   }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
    
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: 60,
        height: 60,
        child: Align(alignment: Alignment.center ,child: Text('${this.shoeSize}', style: TextStyle(fontSize: 20,color: isSelected ? Colors.white : Colors.black , fontWeight: FontWeight.w500),)),
        
        decoration: BoxDecoration(
          color: this.isSelected ? Color.fromRGBO(63, 81, 243, 1):Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1)
            ),
          ],
          borderRadius: BorderRadius.circular(8)
       
        
          
        ),
        
      ),
    );

  }
} 
