import 'package:flutter/material.dart';
import 'package:task642/model/account_model.dart';
import 'package:task642/pages/sign_in.dart';
import 'package:task642/services/db_services.dart';

class SignUp extends StatefulWidget {
  static final String id = "sign_up";
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final emailController =  TextEditingController();
  final addressController =  TextEditingController();
  final numberController =  TextEditingController();
  void _doSignUp()async{
    String email = emailController.text.toString().trim();
    String address =addressController.text.toString().trim();
    String number = numberController.text.toString().trim();
    var account1 = new Account(email: email,address: address,number: number);
    HiveDB().storeAccount(account1);
    var account2 = new HiveDB().loadAccount();
    print(account2.address);
    print(account2.email);
    print(account2.number);
   // print(account2.)
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      height: 80,
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
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
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
                          Text("Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                          SizedBox(height: 5,),
                          TextField(
                            controller: numberController,
                            decoration: InputDecoration(
                                hintText: "Enter number",
                                hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),
                          SizedBox(height: 30,),
                          Text("Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                          SizedBox(height: 5,),
                          TextField(
                            controller: addressController,
                            decoration: InputDecoration(
                                hintText: "Enter address",
                                hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),
                          SizedBox(height: 60,),

                          Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.cyan[800],
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: FlatButton(

                                onPressed: () {
                                  _doSignUp();
                                },
                                child:  Text("Sign In",style: TextStyle(color: Colors.grey[200],fontSize: 20),),
                              )

                          ),
                          SizedBox(height: 40,),
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
                          SizedBox(height: 50,),
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
                                  Navigator.pushReplacementNamed(context, SignIn.id);
                                },
                                child: Text("Sign In",style: TextStyle(color: Colors.cyan[800],fontSize: 17,fontWeight: FontWeight.w700),),
                              ),

                            ],
                          )
                        ],
                      ),
                    )
                  )
              )
            ],
          ),
        ));
  }
}
