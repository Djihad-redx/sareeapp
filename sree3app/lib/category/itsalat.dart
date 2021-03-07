import 'package:flutter/material.dart';
import 'package:sree3app/proudect_game/pslibnan.dart';
import 'package:sree3app/proudect_game/psbahrin.dart';
import 'package:sree3app/proudect_game/pskwt.dart';
import 'package:sree3app/proudect_game/psoman.dart';
import 'package:sree3app/proudect_game/psksa.dart';
import 'package:sree3app/proudect_game/psuae.dart';
import 'package:sree3app/proudect_game/psusa.dart';
import 'package:sree3app/widget/drawer.dart';
import 'games.dart';

class Itsalat extends StatefulWidget {
  @override
  _ItsalatState createState() => _ItsalatState();
}

class _ItsalatState extends State<Itsalat> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     endDrawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('بلي ستيشن',style: TextStyle(color: Colors.black)),
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
                              builder: (context) =>Ps4lib()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                        //  color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بلاي ستيشن لبنان",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/play.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Ps4bahrin()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                          //color: Colors.black,
                          child: ListTile(
                            title: Text(
                              "بلاي ستيشن بحرين",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/play.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Ps4kwt()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                         // color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بلاي ستيشن كويتي",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/play.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Ps4oman()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                     //     color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بلاي ستيشن عماني",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/play.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Ps4ksa()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                      //    color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بلاي ستيشن سعودي",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/play.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Ps4uae()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                        //  color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بلاي ستيشن اماراتي",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/play.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Ps4usa()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                          //color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بلاي ستيشن امريكي",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/play.jpg", fit: BoxFit.cover),
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

