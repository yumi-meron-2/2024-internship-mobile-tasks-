import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'custom_card.dart';
import 'bottom_sheet.dart';
import 'search_text_field.dart';


class SearchPage extends StatefulWidget {
  
  SearchPage({super.key});
  @override
  _searchPageState createState() => _searchPageState();
}
class _searchPageState extends State<SearchPage> {
  bool _isPressed = false;

  final Image image = Image.asset('images/shoe11.png');
  final Text shoeName = Text('Derby Leather Shoes',style: TextStyle(fontWeight: FontWeight.w500,fontFeatures: [FontFeature.enable('palt')],fontSize: 20,),);
  final Text shoeDescription = Text( "Men's shoe",style: TextStyle(color: Colors.grey, fontFeatures: [FontFeature.enable('palt')],fontSize: 10,),);
  

  void _showBottomSheet(){
    setState(() {
      _isPressed = true;
    });
    
  showModalBottomSheet(
    context: context, 
    builder: (BuildContext context){
      return BottomSheetContent();
    },
    ).then((_){
      setState(() {
        _isPressed = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:  Padding(
            padding:  EdgeInsets.only(left: 6.0),
            child:IconButton(
              onPressed: (){Navigator.pop(context);},
             icon: Icon(Icons.arrow_back_ios, color: Color.fromRGBO(63, 81, 243, 1), size: 15.0),)

                
          ),

          title: Text(
            'Search Product', 
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              ),
            ),
              centerTitle: true
        ),
         


        body: Padding(
          padding: const EdgeInsets.only(left: 14.0,top: 14.0,right:14),

          child: Container(
            width: 366,
            height: 700,
            child: SingleChildScrollView(
              child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        width: 270,
                        height: 48,
                        margin: EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child:   MySearchField(),
                      ),
                      Container(
                        width:48,
                        height:48,
                        margin: EdgeInsets.only(right:16),
                        decoration: BoxDecoration(
                          color:_isPressed ?
                           Color.fromRGBO(63, 81, 243, 1)
                            : Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: _showBottomSheet,
                          icon: Icon(
                            Icons.filter_list,
                            color: _isPressed ? Colors.white : Color.fromRGBO(63, 81, 243, 1),
                          )),
                      ),
                        
                        
                      ],
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
                  SizedBox(height: 12),
                  
                  ],
                ),
              
            ),
          )
            
          )
        )

        
      
    );
  }
}
