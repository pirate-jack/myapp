import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Bottom.dart';
import 'package:myapp/Test.dart';
void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Myapp(),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  String emailError,passError;
  bool emailValidate,passValidate;
  bool Pshow = true;
  @override
  void iniState(){
    super.initState();
    emailValidate=passValidate=false;
    emailError=passError="";
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/logo1.jpg",
                height: 150,
                width: 150,
              ),
              Text(
                "Log In Now",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text("Please login to continue using our app"),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelText: "Enter your Email",
                  hintText: "Enter your Email",
                )
                ),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                obscureText: Pshow,
                controller: pass,
                decoration: InputDecoration(
                   // errorText: PassValidate ? PassEroor : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Enter your password",
                    labelText: "Enter your password",
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          Pshow ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          Pshow = !Pshow;
                        });
                      },
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        if(email.text=="admin" && email.text=="admin") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Bottom()));
                        }
                        else{

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid")));
                        }
                      },
                      child: Text(
                        "Log In",
                      )
                  )
              ),
              RichText(text: TextSpan(
                text: "Don't have an account ? ",
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: " Sing up",
                    style: TextStyle(color: Colors.red),
                    recognizer: TapGestureRecognizer()..onTap=(){
    Navigator.pop(context,MaterialPageRoute(builder: (context)=>Test()));
    }
                  ),
                ],
              ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Or connect with"),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/sologo.jpg",height: 50,width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appfild(
      TextEditingController controller, String hinttext, String labeltext) {
    return TextField(
        decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintText: hinttext,
      labelText: labeltext,
    ));
  }
  int validate(){
    int cnt = 0;
    if(email.text.isEmpty)
      {
        setState(() {
          emailError = "";
          emailValidate = true;
        });
      }
    else
      {
        setState(() {
          emailError = "";
          emailValidate = false;
        });
      }
    return cnt;
  }
}
