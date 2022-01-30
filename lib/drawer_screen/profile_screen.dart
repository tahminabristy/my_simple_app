import 'package:day_18/auth/screen/widget/drawer_widgets.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.teal,

      ),
      body:
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Stack(
                    children: [
                      Card(
                        margin: EdgeInsets.all(20),
                        elevation:10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 60,),
                            Center(child: Text('Name',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(child: Text('Job Since Joined Date 08-11-2121',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(thickness: 1,),
                            ),
                            SizedBox(height: 7,),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Contact Info',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                              child: Row(
                                children: [
                                  Text('Email: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text('email@gmail.com',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                              child: Row(
                                children: [
                                  Text('Phone Number: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text('124566789',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(thickness: 1,),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.teal,
                                    radius: 20,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15,
                                      child:Icon( Icons.call,color: Colors.blue,),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.teal,
                                    radius: 20,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15,
                                      child:Icon( Icons.call,color: Colors.blue,),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(backgroundColor: Colors.teal,
                                    radius: 20,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15,
                                      child:Icon( Icons.call,color: Colors.blue,),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(thickness: 1,),
                            ),
                            SizedBox(height: 50,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 100),
                              child: MaterialButton(onPressed:(){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                              },
                                color:Colors.pink.shade700,
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Logout',style: TextStyle(color: Colors.white,),
                                      ),



                                    ],
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(height: 40),


                          ],
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.teal,
                                  width: 4
                                ),
                                image: DecorationImage(
                                  image: NetworkImage('https://cdn.pixabay.com/photo/2021/10/27/19/09/cat-6748193__340.jpg',

                                  ),
                                  fit: BoxFit.cover
                                )
                              ),

                            )
                          ],
                        ),
                      )


                    ],
                  ),
                ],
              ),
            ),
          ),

    );
  }
}
