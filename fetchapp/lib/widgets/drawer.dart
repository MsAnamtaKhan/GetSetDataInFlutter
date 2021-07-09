
import 'package:flutter/material.dart';
import 'package:fetchapp/main.dart';
import 'package:fetchapp/getSSProviders.dart';
import 'package:fetchapp/postSSProviders.dart';

class SideDrawer extends StatelessWidget{
SideDrawer();
@override
Widget build(BuildContext context)
{
  return  Drawer(
          child: ListView(
        padding: EdgeInsets.zero,   
        children: [ 
          UserAccountsDrawerHeader(
          accountName: Text("Anamta Khan"),  
          accountEmail: Text("anamtakhan035@gmail.com"),
          currentAccountPicture:CircleAvatar(         
          backgroundImage:AssetImage('assets/profile.png'),
          maxRadius: 50,),
          decoration: BoxDecoration(color: Colors.red,),),
        
          ListTile(
            leading:Icon(Icons.home,color: Colors.red,size: 35,),
            title:Text("Home"),
            onTap:(){
           Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage(),));
            }
          ),
          Divider(color: Colors.black12,thickness:3.0,),
           ListTile(
            leading:Icon(Icons.inbox,color: Colors.redAccent,),
            title:Text("Fetch Data"),
            onTap:(){
              Navigator.push(context,MaterialPageRoute(builder: (context) => getSSProviders(),));
            }
          ),
           ListTile(
            leading:Icon(Icons.people,color: Colors.red,),
            title:Text("Send Data"),
            onTap:(){
               Navigator.push(context,MaterialPageRoute(builder: (context) => postSSProviders(),));
            }
          ),
          
            
        ],
      )
   );
}
}