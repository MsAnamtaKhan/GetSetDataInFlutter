import 'package:flutter/material.dart';
import './widgets/heading.dart';
import './widgets/para.dart';
import './widgets/drawer.dart';
import './widgets/apptitle.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 5',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
   
        title: AppTitle(),
      ),
      drawer: SideDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(text:'Welcome Home'),
        Padding(padding:EdgeInsets.fromLTRB(70, 40, 0, 0),child: Image.asset('assets/logo.png',height: 200,width: 200,),),
        Para(content:'Welcome to the Home Screen. This App is used to Navigate Between Different Screens With Drawer Widget '
        'and Send or Recieve Data Remotely Using WEB API and Display it on the Screen ')
        ])
    );
  }
}
