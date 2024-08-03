import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'July 31, 2024',
          style: GoogleFonts.syne(
            textStyle:TextStyle(
              color:Color.fromRGBO(170, 170, 170, 1),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          
        ),
        SizedBox(height: 2.0),
        Row(children: [
          Text(
            'Hello,',
            style: GoogleFonts.sora(
            textStyle:TextStyle(
              color:Color.fromRGBO(102, 102, 102, 1),
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),          
          ),
          Text(
            ' YUMI',
            style: GoogleFonts.sora(
            textStyle: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 15,
              fontWeight: FontWeight.w600,))
          ),
        ])
      ],
    );

  }
}