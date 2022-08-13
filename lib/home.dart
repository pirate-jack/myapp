import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/edit_data.dart';
import 'package:myapp/model.dart';

class home extends StatefulWidget {
  home({Key key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: MyModel.advance.length,
              itemBuilder: (context, index) {
                return disp(
                    MyModel.advance[index].getId().toString(),
                    MyModel.advance[index].getName(),
                    MyModel.advance[index].getContact().toString());
              })),
    );
  }

  Widget disp(String id, String name, String con) {
    return Stack(children: [
      Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Id: $id",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "Name: $name",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "Contact: $con",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 10,
        right: 10,
        child: IconButton(
          onPressed: () {
            setState(() {
              for (int i = 0; i < MyModel.advance.length; i++) {
                if (MyModel.advance[i].getId().toString() == id) {
                  MyModel.advance.removeAt(i);
                }
              }
            });
          },
          icon: Icon(
            Icons.delete_outline,
          ),
        ),
      ),
      Positioned(
        bottom: 10,
        right: 50,
        child: IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Edit(id: id,)));
              });
            },
            icon: Icon(Icons.edit)),
      )
    ]);
  }
}
