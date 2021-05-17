import 'package:flutter/material.dart';

class InputContent extends StatelessWidget {

  final Widget img ;
  final String tagLine;
  InputContent(this.img,this.tagLine);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          color: Color(0xFF1D1E33),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 80,
            width: 120,
            child: img,
          ),
        ),
        SizedBox(height: 15.0,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(tagLine,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
            fontSize: 13.0,
            color: Color(0xFF8D8E98),
          ),),
        )
      ],
    );
  }
}

//Card color Color(0xFF1D1E33),