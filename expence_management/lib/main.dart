import 'package:flutter/material.dart';
import 'package:expence_management/home.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:expence_management/note.dart';
import 'package:expence_management/database_helper_exp.dart';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _formkey112 = GlobalKey<FormState>();
  //DatabaseHelper helper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(

            padding: EdgeInsets.all(10),
    child: Form(
        key: _formkey112,
            child: ListView(
              children: <Widget>[
                GestureDetector(
                onTap: (){
                home();
                print("kk");
                },
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'skip',
                      style: TextStyle(
                        color: Color(0xFF5084bc),
                          fontWeight: FontWeight.w500,
                           ),
                    )),),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left:10,right:10,bottom:10,top:120),
                    child: Text(
                      'Expence Management',
                      style: TextStyle(
                          color: Color(0xFF5084bc),
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(10,40,10,10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 23),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.toString());

                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      if(emailValid==false){
                        return 'Please enter valid email';
                      }
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'write email',
                      errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15.0
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                      labelText: 'User email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if(value.length<7){
                        return 'Password must be at least 7 characters';
                      }
                    },
                    obscureText: true,
                    controller: passwordController,

                    decoration: InputDecoration(
                      hintText: 'write password',
                      errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15.0
                      ),
                      filled: true,
                        fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
               //   color: Color(0xFF5084bc),
                  child: Text('Forgot Password',style: TextStyle( color: Color(0xFF5084bc),fontSize: 15.0)),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: ElevatedButton(
                      child: Text('Login',style: TextStyle(
                        fontSize: 25.0, // insert your font size here
                      ),),
                        style: ElevatedButton.styleFrom(
                            primary:  Color(0xFF5084bc),
                            onPrimary: Colors.white,
                            shape:
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Color(0xFF5084bc),width:2),
                                )

                        ),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
    if (_formkey112.currentState!.validate()) {
                        home();}
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?',style: TextStyle(fontSize: 17)),
                        FlatButton(

                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20,color: Color(0xFF5084bc)),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            ))));
  }
}