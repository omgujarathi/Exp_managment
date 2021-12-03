import 'package:expence_management/deleteAllRows_exp.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:expence_management/deleteAllRows_limits.dart';
import 'add_limits.dart';
import 'expence_list.dart';
import 'home.dart';

class settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _settingsState();
  }
}

class _settingsState extends State<settings> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
        title: Text("Settings",style:TextStyle(
        color: Colors.black,
        // fontWeight: FontWeight.w500,
        fontSize: 22,
    )),iconTheme: IconThemeData(color: Colors.black),
    backgroundColor:Colors.white,
    ),

    drawer: Theme(
    data: Theme.of(context).copyWith(
    canvasColor: Colors.grey[300], //This will change the drawer background to blue.
    //other styles
    ),child:Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
    DrawerHeader(
    decoration: BoxDecoration(
    color: Colors.white,
    ),
    child: Text(

    '  Hello world!',

    style: TextStyle(
    color: Colors.black,
    fontSize: 30,
    ),
    ),
    ),
    ListTile(
    leading: Icon(Icons.home,color: Color(0xFF5084bc)),
    title: Text('home'),
    onTap: (){Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(
    builder: (context) => SIForm(),
    ),
    (Route<dynamic> route) => false,
    );}
    ),
    ListTile(
    leading: Icon(Icons.history,color: Color(0xFF5084bc)),
    title: Text('expence history'),
    onTap: (){Navigator.push(context,
    MaterialPageRoute(
    builder: (context) => list_expence(),
    ),
    );}
    ),
    ListTile(
    leading: Icon(Icons.account_circle,color: Color(0xFF5084bc)),
    title: Text('spending categories'),
    onTap: (){Navigator.push(context,
    MaterialPageRoute(
    builder: (context) => limit_module(),
    ),
    );}
    ),
    ListTile(
    leading: Icon(Icons.settings,color: Color(0xFF5084bc)),
    title: Text('Settings'),
        onTap: (){Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => settings(),
          ),
        );}
    ),
    ],
    ),
    ),),
    body: ListView(
      children: <Widget>[
        ListTile(
      leading:  Icon(
      Icons.remove_circle_outline,
      color: Color(0xFF5084bc),
      size: 30.0,
    ),
    title: Text('Delete all expence data',textScaleFactor:1.3),
          onTap: () {
            Future<int> k=deleteExpAll();
            k.then((kll){
              Flushbar(
                title:  "all expences deleted ",
                backgroundColor: Colors.greenAccent,
                message:  "---!!!---",
                duration:  Duration(seconds: 3),
              )..show(context);
            });

          },
    ),
        ListTile(
          leading:  Icon(
              Icons.remove_circle_outline,
              color: Color(0xFF5084bc),
              size: 30.0,
            ),
          title: Text('Delete all category data',textScaleFactor:1.3),
          onTap: () {

            Future<int> k=deleteLimitAll();
            k.then((kll){
              Flushbar(
                title:  "all categories deleted ",
                backgroundColor: Colors.greenAccent,
                message:  "---!!!---",
                duration:  Duration(seconds: 3),
              )..show(context);
            });

          },
        ),


      ]));}}