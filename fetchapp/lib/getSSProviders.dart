import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './widgets/heading.dart';
import './widgets/drawer.dart';
import './widgets/apptitle.dart';

void main() {
  runApp(getSSProviders());
}


class getSSProviders extends StatefulWidget {
  getSSProviders():super();

  @override
  _getSSProvidersState createState() => _getSSProvidersState();
}

class _getSSProvidersState extends State<getSSProviders> {

//List To Store Get Data
late Future<List<getUsersData>> userList;

  @override
void initState()
{
  super.initState();
  //Calling Fetch Data Function 
  userList=fetchData();
}
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset:true,
      appBar: AppBar(
   
        title: AppTitle(),
      ),
      drawer: SideDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //Iterate Through User List And Display Data In Table
          Padding(
            padding:EdgeInsets.fromLTRB(10,10,10,0),
          child:Center(child:FutureBuilder<List<getUsersData>>(
          future:userList,
          builder:(context,xyz){
            if(xyz.hasData){
              List<getUsersData> l1=xyz.data!;
              l1.removeWhere((element) => 
              element.firstName==""
              );
          
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:DataTable(
                
                headingRowColor: MaterialStateColor.resolveWith((states) => Colors.red),
                  columns: [
                DataColumn(label:Text('Id',style: TextStyle(color: Colors.white,fontSize:20),)),
                DataColumn(label:Text('First Name',style: TextStyle(color: Colors.white,fontSize:20),)),
                DataColumn(label:Text('Last name',style: TextStyle(color: Colors.white,fontSize:20),)),
                DataColumn(label:Text('Gender',style: TextStyle(color: Colors.white,fontSize:20),)),
                DataColumn(label:Text('Email',style: TextStyle(color: Colors.white,fontSize:20),)),
                DataColumn(label:Text('Phone',style: TextStyle(color: Colors.white,fontSize:20),)),
              ],rows:l1.map(
                (element)=>DataRow(cells: [
                  DataCell(Text(element.id)),
                   DataCell(Text(element.firstName)),
                    DataCell(Text(element.lastName)),
                     DataCell(Text(element.gender)),
                      DataCell(Text(element.email)),
                       DataCell(Text(element.phone)),
                ])
              ).toList(),));
              }
            else if(xyz.hasError)
            {
               return Text('${xyz.error}');
            }
            return CircularProgressIndicator();
          }

          )))
        ])
    );
  }
}

//Parse Json Data Into List
List<getUsersData> parseData(String responseBody)
{
  final parsed=json.decode(responseBody).cast<Map<String,dynamic>>();
  return parsed.map<getUsersData>((json)=>getUsersData.fromJson(json)).toList();
}

//Function to Fetch Data From Api
Future<List<getUsersData>> fetchData() async {
  
  final response= 
  await http.get(Uri.parse('https://pcc.edu.pk/ws/list/ss_providers.php'));

   if(response.statusCode==200)
   {
     return parseData(response.body);
   }
   else
   {
     throw Exception('Failed to Load Data');
   }
}

//GetUsersData Class To STore Data
class getUsersData{
final String firstName;
final String lastName;
final String email;
final String phone;
final String gender;
final String id;

getUsersData({required this.id,required this.firstName,required this.lastName,required this.gender,required this.email,required this.phone});

factory getUsersData.fromJson(Map<String,dynamic>json){
  return getUsersData(
   id:json['id'],
   firstName:json['firstName'],
   lastName: json['lastName'],
   gender:json['gender'],
   email: json['email'],
   phone:json['phone']
  );
}
}
