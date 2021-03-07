import 'package:flutter/material.dart';
import 'package:sree3app/proudect_internit/stc.dart';
import 'package:sree3app/proudect_itsalat/bakatsts.dart';
import 'package:sree3app/proudect_itsalat/sawa.dart';
import 'package:sree3app/widget/drawer.dart';
class Stcc extends StatefulWidget {
  @override
  _StccState createState() => _StccState();
}

class _StccState extends State<Stcc> {
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
                              builder: (context) => Stc()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                        //  color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "QUIC NET",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/inter/stc.png", fit: BoxFit.cover),
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
                              builder: (context) => Sawa()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                          //color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "SAWA",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/inter/stc.png", fit: BoxFit.cover),
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
                              builder: (context) => Bstc()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                         // color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "باقات STC",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/inter/stc.png", fit: BoxFit.cover),
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
