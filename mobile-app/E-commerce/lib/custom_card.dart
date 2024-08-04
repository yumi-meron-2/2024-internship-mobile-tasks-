import 'package:flutter/material.dart';
import 'dart:ui';

import 'details.dart';

class CardWidget extends StatefulWidget {
  final Image shoeImage;
  final Text shoeName, shoeDescription;
  final int price;
  final double rating;
  final Text dolla = Text('\$',style: TextStyle(fontWeight: FontWeight.w500, fontFeatures: [FontFeature.enable('palt')],fontSize: 12,));
  final Text openBracket = Text('(', style: TextStyle(color: Colors.grey, fontFeatures: [FontFeature.enable('palt')],fontSize: 10,)); 
  final Text closeBracket = Text(')', style: TextStyle(color: Colors.grey, fontFeatures: [FontFeature.enable('palt')],fontSize: 10,)); 
  CardWidget({
    Key? key,
    required this.shoeImage,
    required this.shoeName,
    required this.shoeDescription,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DetailsPage(),),);},
      child: Container(
        color: Colors.white,
        // width: 500,
        // height: 253,
        child: Card(
          margin: EdgeInsets.only(bottom:4.0, top: 12.0,left:12.0,right:12.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                widget.shoeImage,
                SizedBox(height: 8),
                
                Padding(padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [widget.shoeName, Row( children: [widget.dolla ,Text('${widget.price}')]) ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ widget.shoeDescription ,
                        Row(
                          children: [
                            Icon(Icons.star, color: Color.fromRGBO(255, 215, 0, 1), size: 19),
                            widget.openBracket, Text('${widget.rating}',style: TextStyle(color: Colors.grey,fontSize: 12, )), widget.closeBracket,
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ),
              ],
            ),
          ),
        ),
      ),
    );

  }
} 
