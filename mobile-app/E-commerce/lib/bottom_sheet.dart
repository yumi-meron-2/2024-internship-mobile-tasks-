import 'package:flutter/material.dart';
import 'textfield.dart';
import 'slider.dart';


class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Catagory',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
              ],
            ),
            SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: MyTextField(isBottom: true,),
            ),            

        
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Price',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
              ],
            ),
          
            RangeSliderWidget(),
            
            SizedBox(height: 32),
            SizedBox(
              
              width: 377,
              height: 44,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color.fromRGBO(63, 81, 243, 1),),
                  shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),),)
                    ),
                child: Text('Apply', style: TextStyle(color: Colors.white)),),
            ),
            
            
            
          
        ],
      ),
    );
  }
}
