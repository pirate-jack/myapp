import 'package:flutter/material.dart';
import 'package:myapp/Bottom.dart';
import 'package:myapp/model.dart';

class Edit extends StatefulWidget {
  final String id;
   Edit({Key key, this.id}) : super(key: key);
  @override
  State<Edit> createState() => _EditState();
}
class _EditState extends State<Edit> {
  TextEditingController Id = new TextEditingController();
  TextEditingController Name = new TextEditingController();
  TextEditingController Contact = new TextEditingController();
  String IdError, NameError, ContactError;
  bool IdValidate, NameValidate, ContactValidate;
  @override
  void initState() {
    super.initState();
    IdValidate = NameValidate = ContactValidate = false;
    IdError = NameError = ContactError = "";
    for (int i = 0; i< MyModel.advance.length; i++)
      {
        if(MyModel.advance[i].getId().toString()==widget.id)
          {
            Id.text=MyModel.advance[i].getId().toString();
            Name.text=MyModel.advance[i].getName().toString();
            Contact.text=MyModel.advance[i].getContact().toString();
          }
      }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit data"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  enabled: false,
                  controller: Id,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter your New Id",
                    labelText: "Enter your New Id",
                    errorText: IdValidate ? IdError : null,
                    prefixIcon: Icon(Icons.arrow_right),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  controller: Name,
                  decoration: InputDecoration(
                    hintText: "Enter your New Name",
                    labelText: "Enter your New Name",
                    errorText: NameValidate ? NameError : null,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  maxLength: 10,
                  controller: Contact,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter your New Contect number",
                    labelText: "Enter your New Contect number",
                    errorText: ContactValidate ? ContactError : null,
                    prefixIcon: Icon(Icons.wifi_calling_outlined),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                ElevatedButton(
                    onPressed: () {
                      if(validate()==0){
                      setState(() {
                        for(int i = 0; i< MyModel.advance.length;i++)
                          {
                            if(MyModel.advance[i].getId().toString()==widget.id)
                              {
                                MyModel.advance[i].setName(Name.text);
                                MyModel.advance[i].setContact(int.parse(Contact.text));
                              }
                          }
                        Navigator.pop(context);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Bottom()));
                      });
                    }
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  int validate() {
    int cnt = 0;
    if (Id.text.isEmpty) {
      setState(() {
        IdError = "Enter your Id";
        IdValidate = true;
      });
      cnt++;
    } else {
      setState(() {
        IdError = "Enter your Id";
        IdValidate = false;
      });
    }
    if (Name.text.isEmpty) {
      setState(() {
        NameError = "Enter your Id";
        NameValidate = true;
      });
      cnt++;
    } else {
      setState(() {
        NameError = "Enter your Id";
        NameValidate = false;
      });
    }
    if (Contact.text.isEmpty) {
      setState(() {
        ContactError = "Enter your Id";
        ContactValidate = true;
      });
      cnt++;
    } else {
      setState(() {
        ContactError = "Enter your Id";
        ContactValidate = false;
      });
    }
    return cnt;
  }
}
