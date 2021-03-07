import 'package:flutter/material.dart';
import 'package:sree3app/proudect_itsalat/frindi.dart';
import 'package:sree3app/proudect_internit/friendi.dart';
import 'package:sree3app/widget/drawer.dart';
class Friendi2 extends StatefulWidget {
  @override
  _Friendi2State createState() => _Friendi2State();
}

class _Friendi2State extends State<Friendi2> {
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
                              builder: (context) => Friendi()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                       //   color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "FRIENDI بيانات",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/inter/frind.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Frindi()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                         // color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "FRIENDI اتصال",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/inter/frind.jpg", fit: BoxFit.cover),
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
