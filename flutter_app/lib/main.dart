import 'package:flutter/material.dart';
import 'login.dart';
import 'dart:async';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new HomeScreen());
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 245, 153, 1),
      body: Center(

        child: SizedBox.expand(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image( image: AssetImage('assets/panda.png'), height: 250),
              SizedBox(height: 15,),
              Text('Fitness Panda',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 200,
                height: 50,

                child:RaisedButton(onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => Login()));
                },
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 20)),
                      Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                ),)
            ],),
        ),
      ),
    );
  }
}

