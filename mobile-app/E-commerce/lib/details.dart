import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'size.dart';

class DetailsPage extends StatefulWidget {
 
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{
  final Image image = Image.asset('images/shoe2.png');
  final Text shoeName = Text('Derby Leather',style: TextStyle(color:Color.fromRGBO(62, 62, 62, 1), fontWeight: FontWeight.w600,fontFeatures: [FontFeature.enable('palt')],fontSize: 24,),);
  final Text shoeDescription = Text( "Men's shoe",style: TextStyle(color: Colors.grey, fontFeatures: [FontFeature.enable('palt')],fontSize: 10,),);
  final int price = 120;
  final double rating = 4.0;
  final shoeCount = 6;
  final List<int> shoeSizes = [38,39,40,41,42,43,44];
  int? selectedSize = 38;

  void selectSize(int size){
    setState((){
      selectedSize = size;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                this.image,
                    
                Padding(padding: EdgeInsets.only(top: 21.0, left:24.0, right: 24.0 ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ this.shoeDescription ,
                        Row(
                          children: [
                            Icon(Icons.star, color: Color.fromRGBO(255, 215, 0, 1), size: 19),
                            Text('(${this.rating})',style: TextStyle(color: Colors.grey,fontSize: 12, )),
                          ],
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [this.shoeName, Text('\$${this.price}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)],
                    ), 

                    SizedBox(height: 16),
                    Row(children: [Text('Size', style:TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),],) 
                    ,
                    SizedBox(height: 8),
                    Container(
                      color: Colors.white,
                      child: SizedBox(
                        width: 366,
                        height:70,
                        
                        child: ListView.builder(itemBuilder: (BuildContext context, int idx){
                          int size = shoeSizes[idx];
                          return ShoeSize(shoeSize: size,isSelected: selectedSize == size ,onTap: (){selectSize(size);}); }
                        ,itemCount: shoeCount,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                  
                  Container(
                    width: 366,
                    height: 260,
                    child: Text('A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                    style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1),fontSize: 14, fontWeight: FontWeight.w500,),),
                  ),
                  SizedBox(height: 26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        
                        width: 152,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Colors.white,),
                            shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.red)
                              ),
                            ),
                          ),
                          child: Text('DELETE', style: TextStyle(color: Colors.red)),),
                        ),
                      SizedBox(height: 20),
                      
                    
                    
                  SizedBox(
                    
                    width: 152,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Color.fromRGBO(63, 81, 243, 1),
                        ),
                        shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                        ),
                      child: Text('UPDATE', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),),
                  ),
                    ],),
                  ],
                ),
                ),
                
              ],
            ),
            Positioned(
                width: 40,
                height:40,
                top: 35,
                left: 16,
                child:  FloatingActionButton(
                  onPressed: (){Navigator.pop(context);},
                    shape: CircleBorder() ,
                  
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Icon(Icons.arrow_back_ios, color: Color.fromRGBO(63, 81, 243, 1), size: 20,),
                  ),
                  ),
                            ),
          ],
        )
    )
  );
  }
  }  
    
    
    
    
    
    
    
    
    
    
    