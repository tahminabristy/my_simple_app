import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;
  late TextEditingController _nameController=TextEditingController(text: '');
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController = TextEditingController(text: '');
  late TextEditingController _companyNameController = TextEditingController(text: '');
  bool _obscureText =true;
  final _RegistrationFormKey = GlobalKey<FormState>();
  FocusNode _NamefocusNode = FocusNode();
  FocusNode _emailfocusNode = FocusNode();
  FocusNode _passwordfocusNode = FocusNode();
  FocusNode _companyNamefocusNode = FocusNode();
  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _companyNameController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _animationController=AnimationController(vsync:this,duration: Duration(seconds: 20));

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
                Text('SignUp',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),),
                SizedBox(height: 10),
                RichText(text:TextSpan(
                    children: [
                      TextSpan(
                          text: 'Already have an account    ',
                          style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white70
                          )
                      ),
                      TextSpan(
                          text: 'Login',
                          recognizer: TapGestureRecognizer()..onTap=()=>
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()) ),

                          style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Color(0xff588174)
                          )
                      ),


                    ]
                ),),
                SizedBox(height: 40),

                Form(
                  key: _RegistrationFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction:TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_emailfocusNode),
                        focusNode: _NamefocusNode,
                        validator: (value){
                          if(value!.isEmpty|| value.length<20){
                            return 'PLease Enter Full Name ';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        style: TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          hintStyle: TextStyle(color:Colors.white),
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
                      TextFormField(
                        textInputAction:TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_passwordfocusNode),
                        focusNode: _emailfocusNode,
                        validator: (value){
                          if(value!.isEmpty|| value.contains('@')){
                            return 'PLease Enter Valid Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color:Colors.white),
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
                      TextFormField(
                        obscureText: _obscureText,
                        textInputAction:TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_companyNamefocusNode),
                        focusNode: _passwordfocusNode,
                        validator: (value){
                          if(value!.isEmpty|| value.contains('@')|| value.length<6){
                            return 'Make a strong Password';
                          }
                          return null;
                        },

                        controller: _passwordController,
                        style: TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obscureText= !_obscureText;
                                });
                              },
                              child: Icon(_obscureText? Icons.visibility: Icons.visibility_off,)) ,
                          hintText: 'Password',
                          hintStyle: TextStyle(color:Colors.white),
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
                      TextFormField(
                        textInputAction:TextInputAction.done,
                        onEditingComplete: ()=>_itRegistration(),
                        focusNode:_companyNamefocusNode,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'PLease Enter Your Position';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: _companyNameController,
                        style: TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          hintText: 'Position in the company',
                          hintStyle: TextStyle(color:Colors.white),
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

                      SizedBox(height: 15),

                      SizedBox(height: 40),
                      MaterialButton(onPressed:_itRegistration,
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
                                'SignUp ',style: TextStyle(color: Colors.white,),
                              ),
                              SizedBox(height: 20),
                              Icon(Icons.person_add_rounded,
                                  color: Colors.white
                              )


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
    );
  }
  void _itRegistration(){
    final isValid= _RegistrationFormKey.currentState!.validate();
    print(';Invalid $isValid');

  }
}
