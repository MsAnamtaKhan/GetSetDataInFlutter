
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './widgets/heading.dart';
import './widgets/drawer.dart';
import './widgets/apptitle.dart';

void main() {
  runApp(postSSProviders());
}


class postSSProviders extends StatefulWidget {
  postSSProviders():super();

  @override
  _postSSProvidersState createState() => _postSSProvidersState();
}

class _postSSProvidersState extends State<postSSProviders> {

  //Loader 
  late bool loading;   

@override
void initState()
{
  super.initState();
  loading=false;;
}
 //Text Field Cotrollers To Enter Data
  TextEditingController firstNameController=new TextEditingController();
  TextEditingController lastNameController=new TextEditingController();
  TextEditingController genderController=new TextEditingController();
  TextEditingController emailController=new TextEditingController();
  TextEditingController phoneController=new TextEditingController();

//PostData Method to Send Data To API
  Future  PostData() async{
    setState(() {
      loading=true;
    });

    //Assigning Variables to their Values
    String firstName=firstNameController.text;
    String lastName=lastNameController.text;
    String gender=genderController.text;
    String email=emailController.text;
    String phone=phoneController.text;
    
    //Data To be Post
    var sendData={'firstName':firstName,'lastName':lastName,'gender':gender,'email':email,'phone':phone};
    String url='https://pcc.edu.pk/ws/create/ss_providers.php';

    //Post Data Request
    var response=await http.post(Uri.parse(url),body:json.encode(sendData));
    var message=jsonDecode(response.body);
    
    //Display The Response  Message
     if(response.statusCode==200)
     {
        showAlertDialog(context, message);
        setState(() {
          loading=false;
        });

     }
     
  }

//Alert Dialog Function
showAlertDialog(BuildContext context,var message)
{
  Widget okButton=ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Ok'));
  AlertDialog res=AlertDialog(title: Text('Response'),
  content: Text(message['message']),
  actions: [okButton],);
  showDialog(context: context, builder: (BuildContext context){
    return res;
  }
  );
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
      title:AppTitle()
       ),
       drawer: SideDrawer(),

       //If Loading is false Show The Widgets
      body:loading==false?
      Column(
        children:[
          Heading(text:'Send Data'),
          Container(
          width:800,
          height:500,
          padding:new EdgeInsets.fromLTRB(10,20,10,0),

          //Card Widget
          child:Card(
            shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(15.0),
            ),
            elevation:20,
             color:Colors.yellow,
            shadowColor: Colors.blue,
            child:Padding(
              padding: EdgeInsets.fromLTRB(0,30,0,0),
            child:ListView(
            children:[Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                //First Name TEXTFIELD
                 Padding(
                   padding: EdgeInsets.fromLTRB(20,0,20,10), 
                   child:TextField(decoration: InputDecoration(
                    hintText: "Enter your First Name",
                    labelText: "First Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.people,size: 30.0,),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2)),
                      focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2),)
                  ), 
                  controller: firstNameController,
                  )),

                 //Last Name TextField
                 Padding(
                   padding: EdgeInsets.fromLTRB(20,0,20,10), 
                   child:TextField(decoration: InputDecoration(
                    hintText: "Enter Your Last Name",
                    labelText: "Last Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.people,size: 30.0,),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2)),
                      focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2),)
                  ),
                  controller: lastNameController,
                  )),
                  
                  //Gender Text Field
                  Padding(
                   padding: EdgeInsets.fromLTRB(20,0,20,10), 
                   child:TextField(decoration: InputDecoration(
                    hintText: "Enter Your Gender",
                    labelText: "Gender",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.assignment,size: 30.0,),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2)),
                      focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2),)
                  ),
                  controller: genderController,
                  )),

                  //Email Text Field
                   Padding(
                   padding: EdgeInsets.fromLTRB(20,0,20,10), 
                   child:TextField(decoration: InputDecoration(
                    hintText: "Enter Your email",
                    labelText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.email,size: 30.0,),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2)),
                      focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2),)
                  ),
                  controller: emailController,
                  )),

                  //Phone No Text Field
                   Padding(
                   padding: EdgeInsets.fromLTRB(20,0,20,10), 
                   child:TextField(decoration: InputDecoration(
                    hintText: "Enter Your Phone Number",
                    labelText: "Phone Number",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.phone,size: 30.0,),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2)),
                      focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.red,width: 2),)
                  ),
                  controller: phoneController,
                  )),

                  //Elevated Button Widget
                 Padding(
                 padding: EdgeInsets.fromLTRB(10,0,0,0),
                 child: ElevatedButton(onPressed: (){
                 PostData();}, 
                 child: Text('Send Data',style: TextStyle(fontSize: 20),),
                 style: ElevatedButton.styleFrom(primary:Colors.red,
                 padding: EdgeInsets.symmetric(horizontal:30,vertical:20),
                 shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(20.0)))))
               )])
              ]
            ))
          )


        )])
        //If Loading is True Show Progress Indicator
        : Center(child:CircularProgressIndicator())
        
    
    );
  }
}
