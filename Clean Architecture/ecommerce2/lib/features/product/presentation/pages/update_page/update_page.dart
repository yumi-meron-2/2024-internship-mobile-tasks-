import 'package:ecommerce2/features/product/presentation/bloc/update_page_bloc/update_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product.dart';
import '../../bloc/details_page_bloc/details_page_bloc.dart';

import '../../toos_for_pages/image_picker.dart';
import '../../toos_for_pages/navigation_animation.dart';
import '../../toos_for_pages/textfield.dart';



import '../home_page/home_page.dart';


class UpdateProduct extends StatefulWidget {
  ProductEntity product;

  UpdateProduct({required this.product});

  @override
  _UpdateProductState createState() => _UpdateProductState();
  }
  class _UpdateProductState extends State<UpdateProduct> {
    late TextEditingController _nameController;
    // late TextEditingController _categoryController;
    late TextEditingController _priceController;
    late TextEditingController _descriptionController;
    // String? _imagePath;
  
    @override
    void initState() {
      super.initState();
      _nameController = TextEditingController(text: widget.product.name);
      // _categoryController = TextEditingController(text: widget.product.category);
      _priceController = TextEditingController(text: widget.product.price.toString());
      _descriptionController = TextEditingController(text: widget.product.description);
      // _imagePath = widget.product.imageUrl;
    }
  //    @override
  //   void dispose() {
  //     _nameController.dispose();
  //     // _categoryController.dispose();
  //     _priceController.dispose();
  //     _descriptionController.dispose();
  //     super.dispose();
  // }

    // void _updateProduct() {

      
    //   widget.product.name = _nameController.text;
    //   widget.product.category = _categoryController.text;
    //   widget.product.price = double.tryParse(_priceController.text) ?? 0.0;
    //   widget.product.description = _descriptionController.text;
    //   widget.product.imagePath = _imagePath ?? widget.product.imagePath;
    
    //   Navigator.pop(context);
    // }
    // void _onImagePicked(String imagePath){
    //   setState(() {
    //     _imagePath = imagePath;
    //   });
    // }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            leading:  Padding(
              padding:  EdgeInsets.only(left: 6.0),
              child:IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: Icon(Icons.arrow_back_ios, color: Color.fromRGBO(63, 81, 243, 1), size: 15.0),
                ),
              ),


            title: Text(
              'Update Product', 
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
                  Container(
                      height: 280,
                      width: 380,
                      child: Image(image: NetworkImage(widget.product.imageUrl), fit: BoxFit.fill),
                    ),
                  // CustomImagePicker(initialImage: widget.product.imageUrl,),//onImagePicked: _onImagePicked,),
                  SizedBox(height: 22.0),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('name',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1)),),
                  ],
                ),
                  SizedBox(height: 2.0),
              
                  MyTextField(initialValue: widget.product.name, 
                    onChanged: (value) => _nameController.text = value,),
                  
                  SizedBox(height: 10.0),
                  
                //   Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text('catagory',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1),),),
                //   ],
                // ),
                // SizedBox(height: 2.0),
              
                // MyTextField(initialValue: widget.product.category, 
                // onChanged: (value) => _categoryController.text = value,
                // ),
                // SizedBox(height: 10.0),
                
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('price',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1)),),
                ],
                ),
                SizedBox(height: 2.0),
              
                MyTextField(dolla: true,
                  initialValue: (widget.product.price).toString(), 
                    onChanged: (value) => _priceController.text = value,
                    ),

                
                SizedBox(height: 10.0),
                          
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('description',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color.fromRGBO(62, 62, 62, 1)),),
                ],
                ),
                SizedBox(height: 2.0),
              
                MyTextField(iswide: true,
                  initialValue: widget.product.description, 
                    onChanged: (value) => _descriptionController.text = value,
              ),
                
                SizedBox(height: 20),
                SizedBox(
                  
                  width: 377,
                  height: 50,
                  child: 
                  BlocListener<UpdatePageBloc, UpdatePageState>(
                    listener: (context, state) {
                      if (state is UpdatePageLoading ) {
                        Text('Loading...');

                      } else if (state is UpdateSuccessState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                                content: Text(
                                    "Product Updated Successfully.")));
                          Navigator.of(context).push(createFadeRoute(HomePage()));

                      } else if (state is UpdateFailureState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                                content: Text(state.message)));
                            
                      }
                      
                    },
                    child: ElevatedButton(
                      onPressed:(){ context.read<UpdatePageBloc>().add(UpdatePageEvent(product: widget.product));},
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
                // child: Text("hello"),
                ),
              
                SizedBox(height: 16),
                SizedBox(
                  
                  width: 377,
                  height: 50,
                  child: BlocListener<DetailsPageBloc, DetailsPageState>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      Text('Loading....');
                     } else if (state is DeleteSuccessState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(
                                  "Product Deleted Successfully.")));
                        Navigator.of(context).push(createFadeRoute(HomePage()));
                    } else if (state is FailureState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: Text(state.message)));
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () { 
                      context.read<DetailsPageBloc>().add(DetailsPageEvent(id: widget.product.id));
                    },

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
                
                ) 
                
                      
                ],
                
              ),
            ),
          )
        );
      

  }
}

         
