import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'textfield.dart';
import 'image_pick.dart';

class UpdateProduct extends StatelessWidget {

  UpdateProduct({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading:  Padding(
            padding:  EdgeInsets.only(left: 6.0),
            child:IconButton(
              onPressed: (){Navigator.pop(context);},
             icon: Icon(Icons.arrow_back_ios, color: Color.fromRGBO(63, 81, 243, 1), size: 15.0),)

                
          ),


          title: Text(
            'Add Product', 
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              ),
            ),
              centerTitle: true
        ),


        body: Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 10.0,right:20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomImagePicker(),
                
            
             
                    SizedBox(height: 22.0),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('name',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1)),),
                ],
              ),
                SizedBox(height: 2.0),
            
                MyTextField(),
                
                SizedBox(height: 10.0),
                
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('catagory',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1),),),
                ],
              ),
              SizedBox(height: 2.0),
            
               MyTextField(),
              SizedBox(height: 10.0),
              
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('price',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1)),),
              ],
              ),
              SizedBox(height: 2.0),
            
               MyTextField(dolla: true,),

               
              SizedBox(height: 10.0),
                         
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('description',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1)),),
              ],
              ),
              SizedBox(height: 2.0),
            
              MyTextField(iswide: true),
              
              SizedBox(height: 20),
              SizedBox(
                
                width: 377,
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
                  child: Text('UPDATE', style: TextStyle(color: Colors.white)),),
              ),
            
              SizedBox(height: 16),
              SizedBox(
                
                width: 377,
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
              
              
              
                    
              ],
              
            ),
          ),
        )
      ),
    );

  }
}

         
