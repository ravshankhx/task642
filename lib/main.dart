import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task642/pages/sign_in.dart';
import 'package:task642/pages/sign_up.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('task_2');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
      routes: {
        SignIn.id: (context)=> SignIn(),
        SignUp.id: (context)=> SignUp(),

      },
    );
  }
}
