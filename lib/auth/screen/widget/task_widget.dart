import 'package:day_18/auth/screen/widget/task_widgets_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 10,
      child: ListTile(
        onTap: () {
          showDialog(context: context, builder: (ctx){
            return AlertDialog(
              actions: [
                TextButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.delete,color: Colors.pink.shade500,),
                    Text('Delete',style: TextStyle(color: Colors.pink.shade500),)
                  ],
                ))
              ],
            );
          }
          );

        },
        onLongPress: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskWidgetDetails()));
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading:


        Container(
          padding: const EdgeInsets.only(right: 7),
          decoration: BoxDecoration(
              border: Border(

                  right: BorderSide(
                      width: 1, color: Colors.grey.withOpacity(0.6)
                  )
              )
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.amber,
            child: Image.asset('assets/images/2.png', width: 30, height: 30,),
          ),
        ),
        title: Text('Headline',
          maxLines: 2,

          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.linear_scale_outlined, color: Colors.teal,),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting '
                  'industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
              maxLines: 3,
              textAlign: TextAlign.justify,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,


              ),)

          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined, color: Colors.teal, size: 24,),
      ),
    );
  }
}



