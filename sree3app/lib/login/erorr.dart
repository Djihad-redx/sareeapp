import 'package:flutter/material.dart';
class Erorr extends StatefulWidget {
  @override
  _ErorrState createState() => _ErorrState();
}

class _ErorrState extends State<Erorr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Error',style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xfffed700),
      ),
    );
  }
}
