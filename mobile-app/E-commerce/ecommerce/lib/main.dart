import 'package:flutter/material.dart';

import 'custom_title.dart';
import 'custom_actions.dart'; 
import 'custom_available_product.dart';
import 'custom_card.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_product.dart';
void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Image image = Image.asset('images/shoe11.png');
  final Text shoeName = Text('Derby Leather Shoes',style: TextStyle(color:Color.fromRGBO(62, 62, 62, 1), fontWeight: FontWeight.w500,fontSize: 20,),);
  final Text shoeDescription = Text( "Men's shoe",style: TextStyle(color: Colors.grey,fontSize: 10,),);
  final int price = 120;
  final double rating = 4.0;
  
                      
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme,),),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> AddProduct(),),);},
              shape: CircleBorder() ,
              backgroundColor: Color.fromRGBO(63, 81, 243, 1),
              child: Icon(Icons.add, color: Colors.white,size: 40,  ),
              );
          }
        ),
           
        appBar: AppBar(
          backgroundColor: Colors.white,
          
          leading:  Padding(
            padding:  EdgeInsets.only(left: 15.0,top: 3.0,bottom: 6),
            child:  Container(
                width: 70.0,
                height: 10.0,
                decoration: BoxDecoration(color:Colors.grey, borderRadius: BorderRadius.circular(11)),
              child: Icon(Icons.rectangle, color:Colors.grey, size: 0.0)),
        ),

          title:CustomTitle(),

          actions: <Widget>[CustomActions()],
        ),


        body: Padding(
          padding: const EdgeInsets.only(left:14.0,right:14.0,top:14.0),
          child: Column(
            children: [
              // SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(bottom:4.0, top: 12.0,left:12.0,right:12.0),
                child: CustomAvailableProducts(),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.79,
                child: ListView(
                  children: [
                    CardWidget(
                      shoeImage: this.image,
                      shoeName: this.shoeName,
                      shoeDescription: this.shoeDescription,
                      price: 120,
                      rating: 4.0,
                    ),
                    CardWidget(
                      shoeImage: this.image,
                      shoeName: this.shoeName,
                      shoeDescription: this.shoeDescription,
                      price: 120,
                      rating: 4.0,
                    ),
                   CardWidget(
                      shoeImage: this.image,
                      shoeName: this.shoeName,
                      shoeDescription: this.shoeDescription,
                     price: 120,
                     rating: 4.0,
                   ),
                  ],
                ),
              ),
            ]
          )
        )
      
        ),
    
    );
  }
}
