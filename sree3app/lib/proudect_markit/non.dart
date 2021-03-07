import 'package:flutter/material.dart';
import 'package:sree3app/widget/drawer.dart';
import 'package:woocommerce/woocommerce.dart';
import 'package:sree3app/pages/yarab.dart';
String baseUrl = "https://sree3.com.sa/";
String consumerKey = "ck_1c99dcd629e750b54eb416f7064982665b274b34";
String consumerSecret = "cs_8f7c18f423b4b16ab44a6a20325899fac22e9a60";
class Non extends StatefulWidget {
  Non({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NonState createState() => _NonState();
}

class _NonState extends State<Non> {

  List<WooProduct> products = [];
  List<WooProduct> featuredProducts = [];
  WooCommerce wooCommerce = WooCommerce(
    baseUrl: baseUrl,
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
    isDebug: true,
  );

  getProducts() async{
    products = await wooCommerce.getProducts(category: '1281');


    setState(() {
    });
    print(products.toString());
  }

  @override
  void initState() {
    super.initState();
    //You would want to use a feature builder instead.
    getProducts();

  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        endDrawer: AppDrawer(),
        appBar:  AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('بطاقات نون',style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xfffed700),
        ),
        body: Container(
          child: ListView.builder(

            itemBuilder: (context, index) {
              final product = products[index];

              return InkWell(
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Yarab(product)),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 12.0,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 24.0,
                        backgroundImage:  AssetImage('assets/imge/logos/non.png')
                      ),
                      title: Row(
                        children: <Widget>[
                          Column(
                            children: [
                              Container(width: 200,child: Text(product.name,textDirection: TextDirection.rtl)),
                              Text(
                                'SAR  '+ product.price,
                                style: TextStyle(fontSize: 12.0),
                              ),
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
                    ),
                  ],
                ),
              );
            },
            itemCount: products.length,
          )
          ,
        )
        ,
      );
  }
}

