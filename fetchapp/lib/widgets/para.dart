
import 'package:flutter/material.dart';

class Para extends StatelessWidget{
final String content;
Para({required this.content});
@override
Widget build(BuildContext context)
{
  return Padding(padding:EdgeInsets.fromLTRB(20, 30, 20, 0),child:Text(content,textAlign:TextAlign.justify,style:TextStyle(fontSize: 20,color:Colors.black,fontFamily: 'Times New Roman',)),);
}
}