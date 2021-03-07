import 'package:flutter/material.dart';
import 'package:sree3app/widget/drawer.dart';
import 'version.dart';
class Sting extends StatefulWidget {
  @override
  _StingState createState() => _StingState();
}

class _StingState extends State<Sting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
            'الاعدادات', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xfffed700),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [SizedBox(height: 30,),
          InkWell(
              onTap: ()async{


              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: AssetImage('assets/imge/logos/printer.png'),

                ),
                title: Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Container(width: 200,child: Text('نوع الطابعة',textDirection: TextDirection.rtl)),

                      ],
                    ),
                    SizedBox(
                      width: 16.0,
                    ),

                  ],
                ),

                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.0,
                ),
              )),
          SizedBox(height: 30,),
          InkWell(
              onTap: ()async{

              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: AssetImage('assets/imge/logos/key.png'),

                ),
                title: Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Container(width: 200,child: Text('اعدادات الحماية',textDirection: TextDirection.rtl)),

                      ],
                    ),
                    SizedBox(
                      width: 16.0,
                    ),

                  ],
                ),

                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.0,
                ),
              )),
          SizedBox(height: 30,),
          InkWell(
              onTap: ()async{
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Versin())
                );

              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: AssetImage('assets/imge/logos/revv-10.jpg'),

                ),
                title: Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Container(width: 200,child: Text('الاصدار',textDirection: TextDirection.rtl)),

                      ],
                    ),
                    SizedBox(
                      width: 16.0,
                    ),

                  ],
                ),

                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.0,
                ),
              )),],
      ) ,
      endDrawer: AppDrawer(),

    );
  }
}
