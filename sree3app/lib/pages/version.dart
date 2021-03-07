import 'package:flutter/material.dart';

class Versin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffed700),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300,),
            Image.asset('assets/imge/logos/header.png'),
            SizedBox(height: 90,),
            Text('V 1.0',style: TextStyle(fontSize: 40,color: Colors.black,fontFamily: 'DIN Next LT W23',),)
          ],
        ),

      ),

    );
  }
}
