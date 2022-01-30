import 'package:flutter/material.dart';

class UploadTask extends StatefulWidget {

  @override
  _UploadTaskState createState() => _UploadTaskState();
}

class _UploadTaskState extends State<UploadTask> {

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

  TextEditingController _taskController = TextEditingController(text: 'Task Category*');
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _dateController = TextEditingController(text: 'Pick up a Date');
  DateTime? pickDate;

  @override
  void dispose() {

    super.dispose();
    _taskController.dispose();
    _titleController.dispose();
    _descController.dispose();
    _dateController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
        backgroundColor: Color(0xffeee6e2),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50,left: 10,right: 10,bottom: 50),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(child: Text(' All fields are Required ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue.shade900),)),
                    ),
                    Divider(thickness: 1,),
                    Form(child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),

                        _ListTitle(label: 'Task Category* '),

                        _TextField(valukey: 'Task Category', controller: _taskController,  line: 1, enable: false, fct: (){
                          _showTaskcategoryDialog(size:size);

                        }),
                        SizedBox(height: 10),
                        _ListTitle(label: 'Task Title*'),
                        _TextField(valukey: '', controller: _titleController, line: 1, enable: true, fct: (){}),
                        SizedBox(height: 10),
                        _ListTitle(label: 'Task description*'),
                        _TextField(valukey: '', controller: _descController, line:4, enable: true, fct: (){}),
                        SizedBox(height: 10),
                        _ListTitle(label: 'Deadline date*'),
                        _TextField(valukey: 'Pick up a date', controller:_dateController, line: 1, enable: false, fct: (){
                          _pickADate();
                        }),

                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: MaterialButton(onPressed:(){
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                          },
                            color:Colors.pink.shade700,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child:Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Upload',style: TextStyle(color: Colors.white,),
                                  ),



                                ],
                              ),
                            ),

                          ),
                        ),
                        SizedBox(height: 10),



                      ],
                    )
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),


     
    );
  }

  _pickADate()async{
    pickDate= await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:DateTime.now().subtract(Duration(days: 222200)),
        lastDate: DateTime(2100)
    );
    setState(() {
      _dateController.text= '${pickDate!.day}/${pickDate!.month}/${pickDate!.year}';
    });

  }


  Widget _ListTitle({required String label,}){
    return  Text(label ,style: TextStyle(fontSize: 15,color: Colors.pink,fontWeight: FontWeight.bold));
  }


  Widget _TextField({
    required String valukey,
    required TextEditingController controller,


    required int line,
    required bool enable,
    required Function fct,

  }
  )
  {

    return InkWell(
      onTap: (){
        fct();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(

          controller: controller,

          maxLines:line,
          maxLength:valukey==''? 100:null,
          enabled: enable,
          key: ValueKey(valukey),
          style: TextStyle(color: Colors.blue.shade900),

          decoration: InputDecoration(


            filled: true,
            fillColor: Color(0xffeee6e2),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)
            ),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink.shade700)
            ),
          ),

        ),
      ),
    );

  }




   _showTaskcategoryDialog({required Size size}) {
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
                      onTap: (){
                        _taskController.text=taskcategoryList[index];
                      },
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
