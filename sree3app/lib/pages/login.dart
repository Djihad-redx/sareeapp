
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sree3app/pages/sinup.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void initState()
  {
    super.initState();
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar:  AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('LOGIN',style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xfffed700),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Fill Email Input';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  enabled: true,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Fill Password Input';
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  color: Color(0xfffed700),
                  child: Text('Login',style: TextStyle(color: Colors.black),),
                  onPressed: () async {
                    if(_formkey.currentState.validate()){

                      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

                      if(result != null){

                        // pushReplacement

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      }else{
                       return Scaffold(body: Center(child: Text('خطاء في تسجيل الدخول',style: TextStyle(fontSize: 30),),),);
                      }
                    }
                  },
                ),
                // RaisedButton(
                //   color: Color(0xfffed700),
                //   child: Text('Register New Account',style: TextStyle(color: Colors.black),),
                //   onPressed: () async {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen() ) );
                //   },
                // ),
                // RaisedButton(
                //   color: Colors.blue,
                //   child: Text('Register New Account 2 ',style: TextStyle(color: Colors.white),),
                //   onPressed: () async {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen2() ) );
                //   },
                // )

              ],
            )
        ),
      ),
    );
  }



}