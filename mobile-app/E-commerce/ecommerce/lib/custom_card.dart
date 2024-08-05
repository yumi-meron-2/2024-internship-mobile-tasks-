import 'package:flutter/material.dart';
import 'dart:ui';
import 'product.dart';


import 'details.dart';

class CardWidget extends StatefulWidget {
  final Product product;
  final Image shoeImage;
  final Text shoeName, shoeDescription,shoeCategory;
  final double price;
  final double rating;
  final Text dolla = Text('\$',style: TextStyle(fontWeight: FontWeight.w500, fontFeatures: [FontFeature.enable('palt')],fontSize: 12,));
  final Text openBracket = Text('(', style: TextStyle(color: Colors.grey, fontFeatures: [FontFeature.enable('palt')],fontSize: 10,)); 
  final Text closeBracket = Text(')', style: TextStyle(color: Colors.grey, fontFeatures: [FontFeature.enable('palt')],fontSize: 10,)); 
  CardWidget({
    Key? key,
    required this.shoeImage,
    required this.shoeName,
    required this.shoeCategory,
    required this.shoeDescription,
    required this.price,
    required this.rating,
    required this.product,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsPage(product: widget.product)));},
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
                Container(
                  width:366,
                  height: 155,
                  child: widget.shoeImage,
                ),
                
                SizedBox(height: 8),
                
                Padding(padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [widget.shoeName, Row( children: [widget.dolla ,Text('${widget.price}')]) ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ widget.shoeCategory ,
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
