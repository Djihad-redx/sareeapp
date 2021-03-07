import 'package:flutter/material.dart';
import 'package:sree3app/widget/drawer.dart';
import 'games.dart';

import 'package:sree3app/proudect_markit/itunscandi.dart';
import 'package:sree3app/proudect_markit/itunsksa.dart';

import 'package:sree3app/proudect_markit/itunsusa.dart';
import 'package:sree3app/proudect_markit/itunsuae.dart';
import 'package:sree3app/proudect_markit/itunsuk.dart';

class Ituns extends StatefulWidget {
  @override
  _ItunsState createState() => _ItunsState();
}

class _ItunsState extends State<Ituns> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        endDrawer: AppDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('ايتونز',style: TextStyle(color: Colors.black)),
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
                                builder: (context) => tunscandi()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقات ايتونز كندي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/itunes.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Itunsksa()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقات ايتونز سعودي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/itunes.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Itunsusa()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقات ايتونز امريكي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/itunes.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Itunsuae()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقات ايتونز اماراتي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/itunes.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Itunsuk()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقات ايتونز بريطاني",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/itunes.jpg", fit: BoxFit.cover),
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
