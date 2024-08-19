import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../service_locator.dart';

import '../../../domain/usecase/get_all_products.dart';
import '../../bloc/home/get_all_products_bloc.dart';


import '../../toos_for_pages/custom_card.dart';
import '../../toos_for_pages/navigation_animation.dart';
import '../add_product_page/add_product_page.dart';
import 'home_page_action_bar.dart';
import 'home_page_app_bar.dart';
import 'home_page_top_bar.dart';


class HomePage extends StatelessWidget {
  
  final get_all_products_usecase = getIt<GetAllProductsUseCase>();
                      
  HomePage({super.key});

    

  @override
  Widget build(BuildContext context) {
    // setup();
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
      
                title:HomePageAppBar(),
      
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

                      child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
                        builder: (context, state) {
                          if (state is HomeLoadingState){
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }else if ( state is HomeLoadedState){
                            return ListView(
                            children: [
                              for (var product in state.products)
                                CardWidget(
                                  product: product,
                                  shoeName: Text(product.name,style: TextStyle(color:Color.fromRGBO(62, 62, 62, 1), fontWeight: FontWeight.w500,fontSize: 20,)), 
                                  shoeImage: NetworkImage(product.imageUrl),
                                  shoeCategory: Text('shoe', style: TextStyle(color: Colors.grey,fontSize: 10,)) ,
                                  shoeDescription: Text(product.description,style :TextStyle(color: Color.fromRGBO(102, 102, 102, 1),fontSize: 14, fontWeight: FontWeight.w500,)),
                                  price: product.price,
                                  rating: 4.5,
                                  ),
                            ],
                          );
                          }
                          return Text("failed Fetching");
                        },
                      )//Consumer<ProductProvider>(
                        //builder:(context, product_provider, child) {
                          
                        //}
                      //),
                    ),
                  ]
                )
              )
            ),
  
      //routes: {
       // "/addproduct" : (context) => AddProduct(),
       // "/searchpage" : (context) => SearchPage(),


      //},
    
    );
  }
}
