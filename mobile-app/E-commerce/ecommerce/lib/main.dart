import 'package:ecommerce/details.dart';
import 'package:flutter/material.dart';
import 'custom_title.dart';
import 'custom_actions.dart'; 
import 'custom_available_product.dart';
import 'custom_card.dart';
import 'search_page.dart';
import 'update_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product.dart';
import 'product_provider.dart';
import 'package:provider/provider.dart';
import 'add_product.dart';
import 'animation.dart';


void main() {
  runApp(ChangeNotifierProvider
  (create: (context) => ProductProvider(),
    child: MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  
                      
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
              onPressed: () {
                Navigator.of(context).push(createFadeRoute(AddProduct()));},
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
                child: Consumer<ProductProvider>(
                  builder:(context, product_provider, child) {
                    return ListView(
                      children: [
                        for (var product in product_provider.products)
                          CardWidget(
                            product: product,
                            shoeName: Text(product.name,style: TextStyle(color:Color.fromRGBO(62, 62, 62, 1), fontWeight: FontWeight.w500,fontSize: 20,)), 
                            shoeImage: Image.asset(product.imagePath),
                            shoeCategory: Text(product.category, style: TextStyle(color: Colors.grey,fontSize: 10,)) ,
                            shoeDescription: Text(product.description,style :TextStyle(color: Color.fromRGBO(102, 102, 102, 1),fontSize: 14, fontWeight: FontWeight.w500,)),
                            price: product.price,
                            rating: product.rating,
                            ),
                      ],
                    );
                  }
                ),
              ),
            ]
          )
        )
      ),
      routes: {
        "/addproduct" : (context) => AddProduct(),
        "/searchpage" : (context) => SearchPage(),


      },
    
    );
  }
}
