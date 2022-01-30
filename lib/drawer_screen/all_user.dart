
import 'package:day_18/auth/screen/widget/drawer_widgets.dart';
import 'package:day_18/auth/screen/widget/task_widget.dart';
import 'package:flutter/material.dart';

class AllUser extends StatefulWidget {
  const AllUser({Key? key}) : super(key: key);

  @override
  _AllUserState createState() => _AllUserState();
}

class _AllUserState extends State<AllUser> {
  List<String> taskcategoryList = [
    'Home',
    'Study',
    'Office',
    'Others',


  ];

  List<Icon> IconcategoryList = [
    Icon(Icons.home_outlined,color: Colors.amber,),
    Icon(Icons.school_rounded,color: Colors.amber,),
    Icon(Icons.business_center_outlined,color: Colors.amber,),
    Icon(Icons.devices_other_rounded,color: Colors.amber,),


  ];

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          leading: Builder(builder: (ctx) {
            return IconButton(onPressed: () {
              Scaffold.of(ctx).openDrawer();
            }, icon: Icon(Icons.menu, color: Colors.teal,)
            );
          },),
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          elevation: 0,
          title: Text('All User', style: TextStyle(color: Color(0xff588174)),),
          actions: [
            IconButton(
                onPressed: () {
                  _anotherDialog(size: size);

                },
                icon: Icon(Icons.filter_list_outlined, color: Color(0xff588174),
                  size: 30,)
            )
          ],
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return TaskWidget(

              );
            }
        )

    );
  }
  _anotherDialog({required Size size}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Task Category',
                style: TextStyle(fontSize: 20,color: Colors.teal,)),
            content: Container(
              width: size.width*0.9,
              child: ListView.builder(
                  shrinkWrap: true,


                  itemCount:taskcategoryList.length,
                  itemBuilder: (ctxx,index){
                    return InkWell(
                      onTap: (){},
                      child: Row(
                        children:[
                          IconcategoryList[index],

                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(taskcategoryList[index],),
                          )

                        ],
                      ),
                    );

                  }



              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context):null;
                },
                child: Text('Close',style: TextStyle(color: Colors.teal)),
              ),
              TextButton(
                onPressed: (){},
                child: Text('Cancel',style: TextStyle(color: Colors.teal)),
              ),
            ],

          );


        }
    );
  }

}
