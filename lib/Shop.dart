
import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({Key key}) : super(key: key);
  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(100)),
              Center(
                child: ElevatedButton(
                  onPressed: (){showalrt();},child: Text("Shop"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  showalrt() {
    Widget okButton = TextButton(onPressed: () {
      Navigator.of(context).pop();
    }, child: Text("Yes"));
    Widget CancelButton = TextButton(onPressed: () {
      Navigator.of(context).pop();
    },
      child: Text("No"),
    );
    AlertDialog dialog = AlertDialog(
      title: Text("Exit"),
      content: Text("Ok"),
      actions: [okButton, CancelButton],
    );
    showDialog(context: context, builder: (BuildContext context)
    {
      return dialog;
    });
  }
}
