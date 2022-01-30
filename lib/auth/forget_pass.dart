import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_18/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation _animation;
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController = TextEditingController(text: '');
  bool _obscureText =true;
  final _loginFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 20));

    _animation= CurvedAnimation(parent: _animationController, curve:Curves.linear )..addListener(() {
      setState(() {

      });
    })..addStatusListener((animationStatus) {
      if(animationStatus == AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();
      }
    });
    _animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://cdn.pixabay.com/photo/2020/12/14/10/40/leaves-5830590_960_720.jpg",
            placeholder: (context, url) => Image.asset('assets/images/1.jpg',
              fit: BoxFit.cover,

            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value,0.0),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                SizedBox(height:size.height*0.1),
                Text('Forget Password',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),),
                SizedBox(height: 10),
                Text(
                  'Email Address', style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Colors.white)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Colors.green)
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Colors.red)
                    ),

                  ),
                ),
                SizedBox(height: 20),


                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [

                      MaterialButton(onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                        color: Color(0xff52532D),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Reset Pasword',style: TextStyle(color: Colors.white,),
                              ),



                            ],
                          ),
                        ),

                      )
                    ],
                  ),
                )

              ],
            ),
          )


        ],


      ),
    ) ;
  }
  void _itFormLogin(){
    final isValid= _loginFormKey.currentState!.validate();
    print(';Invalid $isValid');

  }
}
