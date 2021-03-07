import 'package:flutter/material.dart';
import 'package:sree3app/widget/drawer.dart';

class card_Detail extends StatefulWidget{
  List data;
  card_Detail(this.data);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }

}


class _State extends State<card_Detail>{
  @override
  Widget build(BuildContext context) {
    print("Length ${widget.data.length}");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("تفاصيل البطاقات",style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xfffed700),
      ),
      body: SafeArea(
        child: ListView(
            children:[ Container(


              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      Divider(
                        height: 12.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: widget.data.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              leading: CircleAvatar(
                                  radius: 24.0,
                                  child: Text("${i+1}"),
                              ),
                              title: Row(
                                children: <Widget>[
                                  Container(child: Text('${widget.data[i]["productName"]}',textDirection: TextDirection.rtl)),
                                  SizedBox(
                                    width: 16.0,
                                  ),

                                ],
                              ),

                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 14.0,
                              ),
                            );
                          },),
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 20),
                      SizedBox(height: 60,),
                      Container(
                        width: 220,

                        child: Image.asset('assets/imge/logos/header.png'),

                      )
                      // InkWell(
                      //     onTap: ()async{
                      //       await FirebaseAuth.instance.signOut();
                      //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()),(Route<dynamic> route) => false);
                      //     },
                      //   child: ListTile(
                      //   leading: CircleAvatar(
                      //       radius: 24.0,
                      //       backgroundImage: AssetImage('assets/imge/logos/logout.jpg'),
                      //
                      //   ),
                      //   title: Row(
                      //     children: <Widget>[
                      //       Column(
                      //         children: [
                      //           Container(width: 200,child: Text('تسجيل خروج من البرنامج',textDirection: TextDirection.rtl)),
                      //
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         width: 16.0,
                      //       ),
                      //
                      //     ],
                      //   ),
                      //
                      //   trailing: Icon(
                      //     Icons.arrow_forward_ios,
                      //     size: 14.0,
                      //   ),
                      // )),

                    ],
                  ),

                ],
              ),

            ),

            ]),
      ),
      endDrawer: AppDrawer(),
    );
  }

}