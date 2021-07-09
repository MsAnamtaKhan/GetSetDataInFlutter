
import 'package:flutter/material.dart';

class Heading extends StatelessWidget{
final String text;
Heading({required this.text});
@override
Widget build(BuildContext context)
{
  return Padding(padding:EdgeInsets.fromLTRB(40, 40, 10, 0),child: Text(text,style:TextStyle(fontSize: 40,color:Colors.red,fontWeight: FontWeight.bold)),);
}
}