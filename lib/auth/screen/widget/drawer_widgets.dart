import 'package:day_18/drawer_screen/all_user.dart';
import 'package:day_18/drawer_screen/profile_screen.dart';
import 'package:day_18/drawer_screen/upload_task.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {


  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  List<String> drawerTextList = [
    'Home',
    'Study',
    'Office',
    'Others',


  ];
  List<Icon> drawerIconcategoryList = [
    Icon(Icons.home_outlined,color: Colors.amber,),
    Icon(Icons.school_rounded,color: Colors.amber,),
    Icon(Icons.business_center_outlined,color: Colors.amber,),
    Icon(Icons.devices_other_rounded,color: Colors.amber,),


  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber

            ),

              child: Column(
                children: [
                  Image.asset('assets/images/2.png', width: 80, height: 80,),
                  SizedBox(height: 8),
                  Text('Tahmina Bristy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

                  Text('Flutter Developer',style: TextStyle(color: Colors.black87,fontSize: 13),),
                ],
              ),
            ),
          SizedBox(height: 30,),
          
          _listTitle(text: 'All Task', icon: Icons.filter, fct: (){}),
          _listTitle(text: 'My Account', icon: Icons.person, fct: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
          }),
          _listTitle(text: 'Register User', icon: Icons.people, fct: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AllUser()));
          }),
          _listTitle(text: 'Add a Task', icon: Icons.assignment_turned_in, fct: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadTask()));
          }),
          Divider(thickness: 1,),
          _listTitle(text: 'Logout', icon: Icons.logout, fct:  (){
            _logout();
          }),



            ]
            
          )

    );
    
  }
  _logout(){
    showDialog(
        context:context,
        builder: (context){
          return AlertDialog(
            content: Text('Do you want to Logout?'),
            actions: [
              TextButton(
                onPressed: () {
                },
                child: Text('Confirm',style: TextStyle(color: Colors.teal),),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Cancel',style: TextStyle(color: Colors.teal)),
              ),
            ],


          );
        }



    );
  }



  Widget _listTitle({required String text,required Function fct,required IconData icon, }){
    return ListTile(
      onTap: (){
        fct();
      },
      leading: Icon(icon,color: Colors.amber,),
      title: Text(text,style: TextStyle(fontSize: 17,color: Colors.black87),),
    );
  }

}

