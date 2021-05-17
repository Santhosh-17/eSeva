import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Widget childCard;
  ReusableCard(this.childCard);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: childCard,
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0) ,
      ),
    );
  }
}
