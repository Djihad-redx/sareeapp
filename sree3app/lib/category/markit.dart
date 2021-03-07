import 'package:flutter/material.dart';
import 'package:sree3app/widget/drawer.dart';
import 'games.dart';
import 'package:sree3app/proudect_markit/non.dart';
import 'package:sree3app/proudect_markit/googleksa.dart';
import 'package:sree3app/proudect_markit/googleuae.dart';
import 'package:sree3app/proudect_markit/googleusa.dart';
import 'package:sree3app/proudect_markit/razr.dart';
import 'package:sree3app/proudect_markit/razargolde.dart';
import 'package:sree3app/proudect_markit/karem.dart';
import 'package:sree3app/proudect_markit/arsol.dart';
import 'package:sree3app/proudect_markit/tmmt.dart';
import 'package:sree3app/proudect_markit/almentor.dart';
import 'package:sree3app/proudect_markit/bysaif.dart';
import 'package:sree3app/proudect_markit/amazonksa.dart';
import 'package:sree3app/proudect_markit/amazonusa.dart';
import 'package:sree3app/proudect_markit/amazonuae.dart';
class Markit extends StatefulWidget {
  @override
  _MarkitState createState() => _MarkitState();
}

class _MarkitState extends State<Markit> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        endDrawer: AppDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Markit',style: TextStyle(color: Colors.black)),
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
                                builder: (context) => Non()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "نون",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/non.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Googleksa()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                            //color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "غوغل بلي سعودي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/google.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Googleuae()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                            //color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "غوغل بلي اماراتي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/google.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Googleusa()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "غوغل بلي امريكي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/google.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Razr()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "رازر غولد امريكي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/razr.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Razrgolde()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "رازر غولد Global",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/razr.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Karem()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقات كريم",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/kareem.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Marsol()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقات شحن مرسول",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/mrsol.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Tmmmt()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                            //color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقات شحن Tmmmt",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/tmmmt.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Almentor()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "بطاقات almentor",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/almentor.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Bysaif()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                            //color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "باي سيف",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/bysaif.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Amazonksa()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "امزون سعودي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/amazooon.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Amazonusa()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "امزون امريكي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/amazooon.jpg", fit: BoxFit.cover),
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
                                builder: (context) => Amazonuae()),
                          );
                        },
                        child: GridTile(
                          footer: Container(
                           // color: Colors.white70,
                            child: ListTile(
                              title: Text(
                                "امزون اماراتي",
                                style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/imge/markit/amazooon.jpg", fit: BoxFit.cover),
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
