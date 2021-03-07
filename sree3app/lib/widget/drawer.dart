import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sree3app/pages/OrdersPage.dart';
import 'package:sree3app/pages/abut.dart';
import 'package:sree3app/pages/login.dart';
import 'package:sree3app/pages/sjil.dart';
import 'package:sree3app/pages/sting.dart';
import '../main.dart';


class AppDrawer extends StatefulWidget {

  @override
  _AppDrawerState createState() => _AppDrawerState();}
class _AppDrawerState extends State<AppDrawer> {
  final storage = new FlutterSecureStorage();
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.home,
              text: 'الصفحة الرئيسية',
              onTap: (){Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => MyApp()),(Route<dynamic> route) => false
              );}
              ),

          _createDrawerItem(
              icon: Icons.account_circle_rounded,
              text: 'ادارة الحساب',
              onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Sting())
              );}),
          _createDrawerItem(
              icon: Icons.description,
              text: 'سجل الطلبات',
              onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderPage())
              );}),
          Divider(),
          _createDrawerItem(icon: Icons.wb_sunny_outlined, text: 'تغير الوضع',onTap: (){

          }),
          _createDrawerItem(icon: Icons.info, text: 'حول الشركة',onTap: (){Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Abut())
          );}),
          _createDrawerItem(icon: Icons.arrow_forward, text: 'تسجيل خروج',onTap: ()async{
            this.storage.write(key: 'token', value: null);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()),(Route<dynamic> route) => false);
          }),

          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }


  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/imge/logos/1.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Sree3",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}