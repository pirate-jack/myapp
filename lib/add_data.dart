import 'package:flutter/material.dart';
import 'package:myapp/Bottom.dart';
import 'package:myapp/model.dart';

class Add extends StatefulWidget {
  const Add({Key key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController Id = new TextEditingController();
  TextEditingController Name = new TextEditingController();
  TextEditingController Contact = new TextEditingController();
  bool flag = false;
  MyModel obj = new MyModel();
  String IdError, NameError, ContactError;
  bool IdValidate, NameValidate, ContactValidate;

  @override
  void initState() {
    super.initState();
    IdValidate = NameValidate = ContactValidate = false;
    IdError = NameError = ContactError = "";
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add data"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                 TextField(
                  controller: Id,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter your Id",
                    labelText: "Enter your Id",
                    prefixIcon: Icon(Icons.arrow_right),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  controller: Name,
                  decoration: InputDecoration(
                    hintText: "Enter your Name",
                    labelText: "Enter your Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  maxLength: 10,
                  controller: Contact,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter your Contect number",
                    labelText: "Enter your Contect number",
                    prefixIcon: Icon(Icons.wifi_calling_outlined),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                ElevatedButton(onPressed: (){
                  setState(() {
                    if(MyModel.advance.isEmpty){
                      obj.setId(int.parse(Id.text));
                      obj.setName(Name.text);
                      obj.setContact(int.parse(Contact.text));
                      MyModel.advance.add(obj);
                      Navigator.pop(context);
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Bottom()));
                    }
                    else
                    {
                      flag=false;
                      for(int i=0;i< MyModel.advance.length;i++)
                        {
                          if(MyModel.advance[i].getId().toString()==Id.text)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid")));
                              flag=true;
                              break;
                            }
                        }
                      if(flag==false){
                        obj.setId(int.parse(Id.text));
                        obj.setName(Name.text);
                        obj.setContact(int.parse(Contact.text));
                        MyModel.advance.add(obj);
                        Navigator.pop(context);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Bottom()));
                      }
                    }
                  }
                  );

                }, child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
