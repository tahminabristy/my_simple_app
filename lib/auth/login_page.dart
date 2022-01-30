import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_18/auth/screen/task_screen.dart';
import 'package:day_18/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'forget_pass.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController = TextEditingController(
      text: '');
  bool _obscureText = true;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));

    _animation =
    CurvedAnimation(parent: _animationController, curve: Curves.linear)
      ..addListener(() {
        setState(() {

        });
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        }
      });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://cdn.pixabay.com/photo/2020/12/14/10/40/leaves-5830590_960_720.jpg",
            placeholder: (context, url) =>
                Image.asset('assets/images/1.jpg',
                  fit: BoxFit.cover,

                ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0.0),

          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.1),
                Text('Login', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),),
                SizedBox(height: 10),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Don\'t have an account    ',
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70
                          )
                      ),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Signup())),
                          text: 'Register?',
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff588174)
                          )
                      ),


                    ]
                ),),
                SizedBox(height: 40),

                Form(
                  key:_loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'PLease Enter Valid Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: _obscureText,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Make a strong Password';
                          }
                          return null;
                        },

                        controller: _passwordController,
                        style: TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText ? Icons.visibility : Icons
                                    .visibility_off, color: Colors.white,)),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              'Forget password', style:
                            TextStyle(fontSize: 17,
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ForgetPassword()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      MaterialButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TaskScreen()));
                        },
                        color: Color(0xff52532D),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login ',
                                style: TextStyle(color: Colors.white,),
                              ),
                              SizedBox(height: 20),
                              Icon(Icons.login,
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




}
