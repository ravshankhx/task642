import 'package:flutter/material.dart';
import 'package:task642/model/user_model.dart';
import 'dart:ui';

import 'package:task642/pages/sign_up.dart';
import 'package:task642/services/db_services.dart';

class SignIn extends StatefulWidget {
  static final String id = "sign_in";

  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController =  TextEditingController();
  final passwordController =  TextEditingController();
  void _doSignIn()async{
    String email = emailController.text.toString().trim();
    String password =passwordController.text.toString().trim();
    var user1 = new User(email: email,password:password);
    HiveDB().storeUser(user1);
    var user2 = new HiveDB().loadUser();
    print(user2.email);
    print(user2.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[800],
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/images/image.jpeg"),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 28,

                    fontWeight: FontWeight.bold),),

                    SizedBox(height: 40,)

                  ],
                ),
              ),


              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                      child: SingleChildScrollView(
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            Text("Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            SizedBox(height: 5,),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: "Enter e-mail",
                                  hintStyle: TextStyle(color: Colors.grey[400])
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            SizedBox(height: 5,),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  hintText: "Enter password",
                                  hintStyle: TextStyle(color: Colors.grey[400])
                              ),
                            ),
                            SizedBox(height: 50,),
                            Center(
                              child: Text("Forgot Password?",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300,color: Colors.grey[300]),),
                            ),
                            SizedBox(height: 40,),
                            Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.cyan[800],
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    _doSignIn();
                                  },
                                  child:  Text("Sign In",style: TextStyle(color: Colors.grey[200],fontSize: 20),),
                                )

                            ),
                            SizedBox(height: 50,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 120,
                                  height: 1.5,
                                  color: Colors.grey[100],
                                ),
                                Text("OR",style: TextStyle(color: Colors.grey[200],fontSize: 20,fontWeight: FontWeight.w500),),
                                Container(
                                  width: 120,
                                  height: 1.5,
                                  color: Colors.grey[100],
                                ),


                              ],
                            ),
                            SizedBox(height: 40,),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(width: 10,),
                                Icon(Icons.facebook_outlined,
                                  color: Colors.blue[700],),



                                Icon(Icons.facebook_outlined),

                                Icon(Icons.facebook_outlined),
                                SizedBox(width: 10,),

                              ],
                            ),
                            SizedBox(height: 60,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?",style: TextStyle(color: Colors.grey[300],fontSize: 16),),
                                SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacementNamed(context, SignUp.id);
                                  },
                                  child: Text("Sign Up",style: TextStyle(color: Colors.cyan[800],fontSize: 17,fontWeight: FontWeight.w700),),
                                ),

                              ],
                            )
                          ],
                        ),
                      )

                    ),
              )
            ],
          ),
        ));
  }
}
