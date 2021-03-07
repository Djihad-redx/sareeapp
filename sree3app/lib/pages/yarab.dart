
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:sree3app/pages/sjil.dart';
import 'package:woocommerce/woocommerce.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sree3app/widget/drawer.dart';

import '../main.dart';
import 'login.dart';
String baseUrl = "https://sree3.com.sa/";
String consumerKey = "ck_1c99dcd629e750b54eb416f7064982665b274b34";
String consumerSecret = "cs_8f7c18f423b4b16ab44a6a20325899fac22e9a60";

class Yarab extends StatefulWidget {
  final WooProduct  product ;
  Yarab(this.product);
  @override
  _YarabState createState() => _YarabState();
}

class _YarabState extends State<Yarab> {
  final deviceTypes = ['1',
    '2',
    '3',
    '4',
    '5',];
  var currentSelectedValue;
  String dropdownValue='1';
  List<WooProduct> products = [];
  List<WooProduct> featuredProducts = [];
  WooCommerce wooCommerce = WooCommerce(
    baseUrl: baseUrl,
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
    isDebug: true,
  );
  getProductCategoryById() async{
    // products = (await wooCommerce) as List<WooProduct>;
    setState(() {
    });
    print(products.toString());
  }

  @override
  void initState() {
    super.initState();
    //You would want to use a feature builder instead.
    getProductCategoryById();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(widget.product.name,style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xfffed700),
        ),
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text(
      //     "تنفيذ الطلب",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   onPressed: () {},
      //   backgroundColor: Color(0xfffed700),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: ListView(
          children:[ Container(


            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
               Text('اسم المنتج :  '+widget.product.name,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15,color: Colors.black ),textDirection: TextDirection.rtl),
                SizedBox(height: 20),
                Text('السعر :  '+ widget.product.price + ' SAR',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15,color: Colors.black ) ,textDirection: TextDirection.rtl,),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("اختار عدد المنتج"),
                            value: currentSelectedValue,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                currentSelectedValue = newValue;
                              });
                              print(currentSelectedValue);
                            },
                            items: deviceTypes.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),),
                SizedBox(height: 20),
                 Column(
                    children: <Widget>[
                      Divider(
                        height: 12.0,
                      ),
            InkWell(
              onTap: () {

              },
              child:
                      ListTile(
                        leading: CircleAvatar(
                            radius: 24.0,
                            backgroundImage: AssetImage('assets/imge/logos/printer.png')
                        ),
                        title: Row(
                          children: <Widget>[
                            Container(child: Text('تنفيذ الطلب',textDirection: TextDirection.rtl)),
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
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyApp()),(Route<dynamic> route) => false
                          );

                        },
                        child: ListTile(
                        leading: CircleAvatar(
                            radius: 24.0,
                            backgroundImage: AssetImage('assets/imge/logos/shop.png')
                        ),
                        title: Row(
                          children: <Widget>[
                            Column(
                              children: [
                                Container(child: Text('ابدأ طلب جديد',textDirection: TextDirection.rtl)),

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
                      SizedBox(height: 20),
                      // InkWell(
                      //   onTap: () {
                      //
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => Sjil())
                      //     );
                      //   },
                      //   child: ListTile(
                      //   leading: CircleAvatar(
                      //       radius: 24.0,
                      //       backgroundImage: AssetImage('assets/imge/logos/images.png'),
                      //
                      //   ),
                      //   title: Row(
                      //     children: <Widget>[
                      //       Column(
                      //         children: [
                      //           Container(child: Text('سجل الطلبات',textDirection: TextDirection.rtl)),
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


class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}
