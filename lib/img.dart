import 'package:flutter/material.dart';

class img extends StatefulWidget {
  const img({Key key}) : super(key: key);

  @override
  State<img> createState() => _imgState();
}

class _imgState extends State<img> {
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
                  onPressed: (){showalrt();},child: Text("Image"),
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
