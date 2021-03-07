import 'package:flutter/material.dart';
import 'package:sree3app/proudect_itsalat/mobily.dart';
import 'package:sree3app/proudect_internit/mobily.dart';
import 'package:sree3app/widget/drawer.dart';
class Mobily2 extends StatefulWidget {
  @override
  _Mobily2State createState() => _Mobily2State();
}

class _Mobily2State extends State<Mobily2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('شحن رصيد و انترنيت',style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xfffed700),
      ),
      body:
      Container(
          width: double.infinity,
          child:
          GridView(

            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [

              Card(
                elevation: 6.0,
                color: Colors.cyanAccent,
                child: Hero(
                  tag: Text('test'),
                  child: Material(
                    child: InkWell(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mobily1()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                          //color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "mobily بيانات",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/inter/mobily.jpg", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Card(
                elevation: 6.0,
                color: Colors.cyanAccent,
                child: Hero(
                  tag: Text('test'),
                  child: Material(
                    child: InkWell(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mobily()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                         // color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "mobily اتصال",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/inter/mobily.jpg", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}
