import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'textfield.dart';
import 'image_pick.dart';
import 'product.dart';
import 'product_provider.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  

  @override
  _AddProductState createState() => _AddProductState();
}

  class _AddProductState extends State<AddProduct>{
    final TextEditingController _namecontroller = TextEditingController();
    final TextEditingController _categoryController = TextEditingController();
    final TextEditingController _priceController = TextEditingController();
    final TextEditingController _descriptionController = TextEditingController();
    String? _imagePath;
  

  // AddProduct({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                CustomImagePicker(
                  onImagePicked: (imagePath){
                    setState((){
                      _imagePath = imagePath;
                    });
                  }
                ),
             
                SizedBox(height: 22.0),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('name',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1)),),
                ],
              ),
                SizedBox(height: 2.0),
            
                MyTextField(
                  initialValue: '',
                  onChanged: (value){
                    _namecontroller.text = value;
                  },
                ),
                
                SizedBox(height: 10.0),
                
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('catagory',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1),),),
                ],
              ),
              SizedBox(height: 2.0),
            
              MyTextField(
                initialValue: '',
                onChanged: (value) {
                  _categoryController.text = value;
                },
              ),
              SizedBox(height: 10.0),
              
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('price',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1)),),
              ],
              ),
              SizedBox(height: 2.0),
            
              MyTextField(
                dolla: true,
                initialValue: '',
                onChanged: (value) {
                  _priceController.text = value;
                },
              ),

               
              SizedBox(height: 10.0),
                         
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('description',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1)),),
              ],
              ),
              SizedBox(height: 2.0),
            
              MyTextField(
                iswide: true,
                initialValue: '',
                onChanged: (value) {
                  _descriptionController.text = value;
                },
              ),
              
              SizedBox(height: 20),
              SizedBox(
                
                width: 377,
                height: 50,
                child: ElevatedButton(
                  onPressed:(){
                    final newProduct = Product(
                      name: _namecontroller.text,
                      category: _categoryController.text,
                      price: double.tryParse(_priceController.text) ?? 0.0,
                      description: _descriptionController.text,
                      imagePath: _imagePath?? '',
                      rating: 4.5,
                    
                    );
                    Provider.of<ProductProvider>(context, listen: false).addProduct(newProduct);
                    Navigator.pop(context);
                    },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color.fromRGBO(63, 81, 243, 1),
                    ),
                    shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                    ),
                  child: Text('ADD', style: TextStyle(color: Colors.white)),),
              ),
            
              SizedBox(height: 16),
              SizedBox(
                
                width: 377,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){Navigator.pop(context);},
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
      );
      
 

  }
}

         
