import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/signin.dart';
import 'package:flutter_app/user.dart';
import 'package:mysql1/mysql1.dart';

Future<String> sql(String email, String password) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'eu-cdbr-west-01.cleardb.com',
      port: 3306,
      user: 'b22d4cb0d6f8a0',
      db: 'heroku_f7599789d9660de',
      password: 'f790f5b1'));
  var result = await conn.query('select email, first_name, password from users where email = ? and password = ?', [email, password]);
  for(var row in result) {
    print('Email ${row[0]}, password ${row[2]}');
    return await row[1];
  }
  return '';
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new HomeScreen());
  }
}
class HomeScreen extends StatelessWidget{

  TextEditingController imputemail = new TextEditingController();
  TextEditingController imputpassword = new TextEditingController();

  String email='', password='';

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
              Image( image: AssetImage('assets/panda.png'), height: 250),
              SizedBox(height: 20,),
              SizedBox(
                child: Align(
                  alignment: Alignment(-0.75,0),
                  child: Text('Username',
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
                        hintText: 'Enter username'),)),
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
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Password'),
                  )),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                height: 50,

                child:RaisedButton(onPressed: () {
                  email=imputemail.text;
                  password=imputpassword.text;
                  var i = sql(email, password).toString();

                  Navigator.push(context, new MaterialPageRoute(builder: (context) => User(fname: i)));
                },
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),],),
                ),),
              SizedBox(height: 20,),
              SizedBox(
                width: 200,
                height: 50,

                child:RaisedButton(onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => Signin()));
                },
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Signin', style: TextStyle(color: Colors.white, fontSize: 20)),
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