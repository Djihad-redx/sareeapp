import 'package:flutter/material.dart';
import 'package:sree3app/widget/drawer.dart';
import 'games.dart';
import 'package:sree3app/proudect_cinama/nteflixuae.dart';
import 'package:sree3app/proudect_cinama/nteflixusa.dart';
import 'package:sree3app/proudect_cinama/weak.dart';
import 'package:sree3app/proudect_cinama/kitab.dart';
import 'package:sree3app/proudect_cinama/shahd.dart';
import 'package:sree3app/proudect_cinama/star.dart';
class Cinama extends StatefulWidget {
  @override
  _CinamaState createState() => _CinamaState();
}

class _CinamaState extends State<Cinama> {

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        endDrawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Cinema',style: TextStyle(color: Colors.black)),
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
                              builder: (context) => Nteflixuae()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                          //color: Colors.white70,
                          child: ListTile(
                            title: Text(
                             "نتفلكس اماراتي",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/cinma/neyflix.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Nteflixusa()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                          //color: Colors.white70,
                          child: ListTile(
                            title: Text(
                             "نتفلكس امريكي",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/cinma/neyflix.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Weak()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                         // color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بطاقات وياك",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/cinma/oeak.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Kitab()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                         // color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بطاقات كتاب صوتية",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/cinma/kitab.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Shahd()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                         // color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بطاقات شاهد",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/cinma/shahid.jpg", fit: BoxFit.cover),
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
                              builder: (context) => Star()),
                        );
                      },
                      child: GridTile(
                        footer: Container(
                        //  color: Colors.white70,
                          child: ListTile(
                            title: Text(
                              "بطاقات ستارز بلي",
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/imge/cinma/star.jpg", fit: BoxFit.cover),
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
