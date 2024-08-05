import 'dart:ui';

import 'package:flutter/material.dart';
import 'search_page.dart';

class CustomAvailableProducts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text(
            'Available Products',
            
            textAlign: TextAlign.left,
            style: TextStyle(
              color:Color.fromRGBO(62, 62, 62, 1),
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          // ),
        ),


        Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(217, 217, 217, 1), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: IconButton(
            onPressed: (){Navigator.pushNamed(context, "/searchpage");},
            icon: Icon(
              Icons.search,
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
          ),
        ),
        ]
      ),
    );
    
  }
}