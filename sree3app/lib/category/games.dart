import 'package:flutter/material.dart';
import 'package:sree3app/proudect_game/fifa.dart';

import 'package:sree3app/proudect_game/stem.dart';
import 'package:sree3app/proudect_game/netindo.dart';
import 'package:sree3app/proudect_game/lords.dart';
import 'package:sree3app/proudect_game/freefiar.dart';
import 'package:sree3app/proudect_game/glsat.dart';
import 'package:sree3app/proudect_game/blot.dart';
import 'package:sree3app/proudect_game/roblox.dart';
import 'package:sree3app/proudect_game/leagof.dart';
import 'package:sree3app/proudect_game/pubg.dart';
import 'package:sree3app/proudect_game/xboxksa.dart';
import 'package:sree3app/proudect_game/xboxusa.dart';
import 'package:sree3app/proudect_game/xboxuae.dart';
import 'package:sree3app/widget/drawer.dart';


class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        endDrawer: AppDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Games',style: TextStyle(color: Colors.black)),
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
                                builder: (context) => Fifa()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                            //color: Colors.white70,
                            child: ListTile(
                             title:  Text(
                                "فيفا",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/fifa.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Stem()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقة ستيم",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/stem.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Netendo()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقة نيتندو امريكي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/netindo.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Lors()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقة لوردس موبايل",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/lords.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Freefair()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                            //color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقة فري فاير",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/freef.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Glsat()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقة شحن جلسات VIP",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/blotvip.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Blot()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                            //color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقة شحن بلوت VIP",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/blotvip.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Roblox()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقة Roblox",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/roblox.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Leag()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقة Mobiloe legends",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/legend.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Pubg()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقة  pubg Mobiloe  ",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/pubg.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Xboxksa()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "اكس بوكس سعودي  ",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/xbox.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Xboxusa()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                            //color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "اكس بوكس امريكي  ",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/xbox.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Xboxuae()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "اكس بوكس اماراتي  ",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/xbox.jpg", fit: BoxFit.cover),
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

