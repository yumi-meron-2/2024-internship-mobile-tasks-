import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class CustomImagePicker extends StatefulWidget {
  final String? initialImage;
  final ValueChanged<String>? onImagePicked;

  const CustomImagePicker({
    this.initialImage,
    this.onImagePicked,
    super.key,
    });

  @override
  _CustomImagePickerState  createState() => _CustomImagePickerState(); 
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? myImage;

  @override
  void initState(){
    super.initState();
    if (widget.initialImage != null){
      myImage = File(widget.initialImage!);
    }
  }

  Future<void> _pickImage() async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null){
      setState(() {
        myImage = File(pickedFile.path);
        if (widget.onImagePicked! != null){
          widget.onImagePicked!(pickedFile.path);
        }
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: (myImage == null && widget.initialImage == null) 
        ? Container(
          width: 342,
          height: 190,
          decoration: BoxDecoration(
            color: Color.fromRGBO(243, 243, 243, 1),
            border: Border.all(color: Color.fromRGBO(243, 243, 243, 1), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),

          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  Icon(Icons.image_outlined, color: Color.fromRGBO(62, 62, 62, 1),size: 50),
                  SizedBox(height:10), 
                  Text('Upload Image', style: TextStyle(color: Color.fromRGBO(62, 62, 62, 1),fontSize: 10))
                  ],
                ),
              )
            )
        ): Container(
          width: 342,
          height: 190,
          decoration: BoxDecoration(
            color: Color.fromRGBO(243, 243, 243, 1),
            border: Border.all(color: Color.fromRGBO(243, 243, 243, 1), width: 1),
            borderRadius: BorderRadius.circular(16),
            image: myImage != null
              ? DecorationImage(image: FileImage(myImage!), fit: BoxFit.cover)
              : widget.initialImage != null
                ? DecorationImage(image: NetworkImage(widget.initialImage!), fit: BoxFit.cover)
                : null,
          ),
          ),
    )
    ;
  }
}