import 'package:flutter/material.dart';

class CustomActions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(217, 217, 217, 1), width: 1),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: IconButton(
        onPressed: null,
        icon: Icon(
          Icons.notifications_outlined,
          color: Color.fromRGBO(102, 102, 102, 1),
        ),
      ),
);
    
  }
}