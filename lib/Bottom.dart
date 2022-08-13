import 'package:flutter/material.dart';
import 'package:myapp/Profile.dart';
import 'package:myapp/Shop.dart';
import 'package:myapp/add_data.dart';
import 'package:myapp/home.dart';
import 'package:myapp/img.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int selectedIndex = 0;

  List<Widget> centerScreen = [
    home(),
    Shop(),
    img(),
    Profile(),
  ];

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app bar"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("profile"),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text("setting"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Log out"),
                  value: 2,
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print("profil");
              } else if (value == 1) {
                print("setting");
              } else {
                print("Log out");
              }
            },
          )
        ],
      ),
      body: Center(
        child: centerScreen.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_business_outlined),
              label: "Shop",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: "image",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "profile",
              backgroundColor: Colors.red),
        ],
        onTap: onItemTap,
        iconSize: 30,
        selectedItemColor: Colors.black,
        elevation: 15,
        currentIndex: selectedIndex,
        backgroundColor: Colors.red,
       ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/k1logo.jpg"),
                  fit: BoxFit.cover
                )
              ),
              currentAccountPicture: CircleAvatar(
                radius: 20,
                child: Image.asset("assets/41.jpg",height: 100,width: 100,),),
                accountName: Text("Kris Patel"),
                accountEmail: Text("krispatel2323@gmail.com")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
            ),ListTile(
              leading: Icon(Icons.wifi_calling_outlined),
              title: Text("Contact"),
            ),ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
            ),
          ],
        ),
      ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         Navigator.push(context,MaterialPageRoute(builder: (context)=>Add()));
       },
           child: Icon(Icons.add),
     ),
    );
  }
}
