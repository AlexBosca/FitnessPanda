import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import 'package:mysql1/mysql1.dart';


Future sql(String email, String fname, String lname, String password) async{
  final conn =await MySqlConnection.connect(ConnectionSettings(
      host: 'eu-cdbr-west-01.cleardb.com',
      port: 3306, user:'b22d4cb0d6f8a0',
      db:'heroku_f7599789d9660de',
      password: 'f790f5b1'));
  var result = await conn.query(
      'insert into users (email, first_name, last_name, password) values (?, ?, ?, ?)',
      [email, fname, lname, password]);
  await conn.close();
}

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new HomeScreen());
  }
}
class HomeScreen extends StatelessWidget {

  TextEditingController imputemail = new TextEditingController();
  TextEditingController imputfname = new TextEditingController();
  TextEditingController imputlname = new TextEditingController();
  TextEditingController imputpassword = new TextEditingController();

  String email='', fname='', lname='', password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 245, 153, 1),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20,),
              SizedBox(
                child: Align(
                  alignment: Alignment(-0.75,0),
                  child: Text('Email',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              SizedBox(
                  width: 300,
                  height: 40,

                  child: TextField(
                    controller: imputemail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter email'),)),
              SizedBox(height: 15,),
              SizedBox(
                child: Align(
                  alignment: Alignment(-0.75,0),
                  child: Text('First name',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              SizedBox(
                  width: 300,
                  height: 40,

                  child: TextField(
                    controller: imputfname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter first name'),
                  )),
              SizedBox(height: 15,),
              SizedBox(
                child: Align(
                  alignment: Alignment(-0.75,0),
                  child: Text('Last name',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              SizedBox(
                  width: 300,
                  height: 40,

                  child: TextField(
                    controller: imputlname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter last name'),
                  )),
              SizedBox(height: 15,),
              SizedBox(
                child: Align(
                  alignment: Alignment(-0.75,0),
                  child: Text('Password',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              SizedBox(
                  width: 300,
                  height: 40,

                  child: TextField(
                    controller: imputpassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password'),
                  )),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                height: 50,

                child:RaisedButton(onPressed: () {
                  email=imputemail.text;
                  fname=imputfname.text;
                  lname=imputlname.text;
                  password=imputpassword.text;
                  sql(email, fname, lname, password);
                },
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Signin', style: TextStyle(color: Colors.white, fontSize: 20)),],),
                ),),
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
                      Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),)

            ],
          ),
        ),
      ),
    );
  }
}