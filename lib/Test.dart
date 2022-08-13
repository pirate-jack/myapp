import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Login.dart';

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController Name = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Pass = new TextEditingController();
  TextEditingController Contect = new TextEditingController();
  TextEditingController Address = new TextEditingController();
  bool Pshow = true;
  String NameError, EmailError, PassEroor, ContError, AddError;
  bool NameValidate, EmailValidate, PassValidate, ContValidate, AddValidate;
  @override
  void initState() {
    super.initState();
    NameValidate = EmailValidate =PassValidate = ContValidate = AddValidate= false;
    NameError = EmailError = PassEroor = ContError = AddError = "";
  }

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
        height: 5,
      ),
      Image.asset(
        "assets/logo1.jpg",
        height: 150,
        width: 150,
      ),
      Text(
        "Sign up Now",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Text("Please fill the details and create account"),
      Padding(padding: EdgeInsets.all(15)),

      TextField(
            controller: Name,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "Enter your Fullname",
                hintText: "Enter your Fullname",
                errorText: NameValidate ? NameError : null),
          ),
          Padding(padding: EdgeInsets.all(5)),
          TextField(
            controller: Email,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "Enter your Email",
                hintText: "Enter your Email",
                errorText: EmailValidate ? EmailError : null),
          ),
          Padding(padding: EdgeInsets.all(5)),
          TextField(
            obscureText: Pshow,
            controller: Pass,
            decoration: InputDecoration(
                errorText: PassValidate ? PassEroor : null,
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
          Padding(padding: EdgeInsets.all(5)),
          TextField(
            maxLength: 10,
            controller: Contect,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              errorText: ContValidate ? ContError : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: "Enter your Contect number",
              labelText: "Enter your Contect number",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          TextField(
            controller: Address,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "Enter your Address",
                hintText: "Enter your Address",
                errorText: AddValidate ? AddError : null),
          ),
          Padding(padding: EdgeInsets.all(5)),
          ElevatedButton(
              onPressed: () {
                if (validate() == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login()));
                }
              },
              child: Text("Sign up")),
          Padding(padding: EdgeInsets.all(10)),
          Text("Or connect with"),
          Image.asset(
            "assets/sologo.jpg",
            height: 50,
            width: 200,
          ),
          RichText(text: TextSpan(
            text: "you have already have account ? ",
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                  text: " Log in",
                  style: TextStyle(color: Colors.red),
                  recognizer: TapGestureRecognizer()..onTap=(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
                  }
              ),
            ],
          ),
          ),
        ],

      ),
    )
    )
      )
    );
  }

  int validate() {
    int cnt = 0;
    if (Name.text.isEmpty) {
      setState(() {
        NameError = "Enter Fullname";
        NameValidate = true;
      });
      cnt++;
    } else {
      setState(() {
        NameError = "";
        NameValidate = false;
      });
    }
    if (Email.text.isEmpty) {
      setState(() {
        EmailError = "Enter Email";
        EmailValidate = true;
      });
      cnt++;
    } else {
      setState(() {
        EmailError = "";
        EmailValidate = false;
      });
    }
    if (Pass.text.isEmpty) {
      setState(() {
        PassEroor = "Enter your Password";
        PassValidate = true;
      });
      cnt++;
    } else {
      setState(() {
        PassEroor = "Enter your Password";
        PassValidate = false;
      });
    }
    if (Contect.text.isEmpty) {
      setState(() {
        ContError = "Enter your Contact";
        ContValidate = true;
      });
      cnt++;
    } else {
      setState(() {
        ContError = "Enter your Contact";
        ContValidate = false;
      });
    }
    if (Address.text.isEmpty) {
      setState(
            () {
          AddError = "Enter your Address";
          AddValidate = true;
        },
      );
      cnt++;
    } else {
      setState(() {
        AddError = "Enter your Address";
        AddValidate = false;
      });
    }
    return cnt;
  }
}
