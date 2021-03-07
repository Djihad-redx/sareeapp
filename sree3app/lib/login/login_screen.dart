import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../globals.dart';
import '../main.dart';
import 'auth.dart';
import 'erorr.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final storage = new FlutterSecureStorage();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void tryToken({String token}) async {
    if (token == null) {
      return;
    } else {
      try {
        var url = urlWebSite+'api/user';
        // Await the http get response, then decode the json-formatted response.
        var response = await http.get(url,headers: {'content-type':'application/json','Authorization': 'Bearer $token'});
        print("res:${response}");

      } catch (e) {
        print(e);
      }
    }
  }

  void storeToken({String token}) async {
    this.storage.write(key: 'token', value: token);
    Token=token;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }
  Future LoginMethod() async{
    Map<String,dynamic> body1={
      "email":_emailController.text,
      "password":_passwordController.text,
      "device_name":"mobile"
    };
    var bod=jsonEncode(body1);
    var url = urlWebSite+'api/user/login';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,body: body1,headers: {'Accept':'application/json'});


    print("body"+response.body);
    Map<String,dynamic> cat=jsonDecode(response.body);
    if(cat["token"]!=null){
      print("Token11 ${cat["token"]}");
      this.storeToken(token: cat["token"]);
      tryToken(token: cat["token"]);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainHPClass()));
    }else{
      final snackBar = SnackBar(
        content: Text('تاكد من كلمة السر او الايميل'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

  }
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.text = 'ababdoiuy@gmial.com';
    _passwordController.text = '123412341234';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  controller: _emailController,
                  validator: (value) =>
                  value.isEmpty ? 'please enter valid email' : null),

              TextFormField(
                  controller: _passwordController,
                obscureText:false,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value) =>
                  value.isEmpty ? 'please enter password' : null),

              SizedBox(
                height: 10,
              ),
              FlatButton(
                minWidth: double.infinity,
                color: Colors.blue,
                child: Text('Login', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Map creds = {
                    'email': _emailController.text,
                    'password': _passwordController.text,
                    'device_name': 'mobile',
                  };
                  if (_formKey.currentState.validate()) {
                    LoginMethod();
                    /*Provider.of<Auth>(context, listen: false)
                        .login(creds: creds);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );*/
                  }
                  else{
                    final snackBar = SnackBar(
                      content: Text('املاء جميع الحقول'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    _scaffoldKey.currentState.showSnackBar(snackBar);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
