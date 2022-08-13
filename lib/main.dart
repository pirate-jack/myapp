import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Login.dart';
import 'Test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Myapp(),
    );
  }
}

class Myapp extends StatefulWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/logo1.jpg",
                  height: 150,
                  width: 150,
                ),
                Image.asset("assets/shopping1.png"),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text("Create an account and access cool stuffs"),
                SizedBox(
                  height: 150,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Test()));
                        }, child: Text("Getting Started"))),
                RichText(
                    text: TextSpan(
                        text: "Already have an account ?",
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: " Login",
                          style: TextStyle(
                              color: Colors.red,
                          ),
                        recognizer: TapGestureRecognizer()..onTap=() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Login()));
                        }
                      ),
                    ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
