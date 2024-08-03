import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState(); 
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? myImage;

  Future<void> _pickImage() async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null){
        myImage = File(pickedFile.path);
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: (myImage == null) ? Container(
        width: 342,
        height: 190,
        decoration: BoxDecoration(
          color: Color.fromRGBO(243, 243, 243, 1),
          border: Border.all(color: Color.fromRGBO(243, 243, 243, 1), width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: const Column(children: [Icon(Icons.image_outlined, color: Color.fromRGBO(62, 62, 62, 1),size: 50),SizedBox(height:10), Text('Upload Image', style: TextStyle(color: Color.fromRGBO(62, 62, 62, 1),fontSize: 10))],),
        ))
      ): Container(
        width: 342,
        height: 190,
        decoration: BoxDecoration(
          color: Color.fromRGBO(243, 243, 243, 1),
          border: Border.all(color: Color.fromRGBO(243, 243, 243, 1), width: 1),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: FileImage(myImage!),
                  fit: BoxFit.cover)
          
        ),
        ),
    )
    ;
  }
}