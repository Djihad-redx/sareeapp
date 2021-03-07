import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sree3app/pages/Cart.dart';
import 'package:sree3app/pages/sting.dart';
import 'package:sree3app/pages/yarabAP.dart';
import 'package:sree3app/widget/drawer.dart';
import 'package:woocommerce/woocommerce.dart';
import 'package:sree3app/pages/yarab.dart';
import 'package:http/http.dart' as http;
import '../globals.dart';
class OneProduct extends StatefulWidget {
  String Name,image;
  int id;
  OneProduct(this.id,this.Name,{this.image});
  @override
  _NteflixuaeState createState() => _NteflixuaeState();
}

class _NteflixuaeState extends State<OneProduct> {
  List<WooProduct> products = [];
  List<WooProduct> featuredProducts = [];
  String type;
  Future<List> getChildProduct() async {
    Map<String,dynamic> body1={
      "id":widget.id,
    };
    var bod=jsonEncode(body1);
    print("Body ${bod}");
    print("Token ${Token}");
    var url = urlWebSite+'api/ChildCategoriesOrProducts';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,body:bod,headers: {'content-type':'application/json','Accept':'application/json', 'Authorization':"Bearer ${Token}"});
    //print("body"+response.body);
    Map<String,dynamic> cat=jsonDecode(response.body);
    print(cat);
    try{
      type=cat["type"];
      return cat["data"];
    }catch(e){ print(e);
    return null;

    }
  }

  @override
  void initState() {
    super.initState();
    //You would want to use a feature builder instead.
    getChildProduct();

  }
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.yellow.shade200,
          endDrawer: AppDrawer(),
          appBar:  AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text('${widget.Name}',style: TextStyle(color: Colors.black)),
            backgroundColor: Color(0xfffed700),
            leading: Padding(
              padding: const EdgeInsets.only(left:12.0),
              child:
              InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart(),));
                  },
                  child: Icon(Icons.shopping_cart,size: 35,color: Colors.black,)),

            ),
          ),
          body: Container(
            child:FutureBuilder(
              future: getChildProduct(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (snapshot.data == null)
                  return new Container(
                    child: Center(child: new CircularProgressIndicator()),
                  );
                else
                  return  ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if(type=="products"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YarabAP(snapshot.data[index],index)),
                            );
                          }else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OneProduct(snapshot.data[index]['id'], snapshot.data[index]['name'],image: snapshot.data[index]['image'],)),
                            );
                          }
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Yarab(product)),
                          );*/
                        },
                        child: type == "products"?Column(
                          children: <Widget>[
                            Divider(
                              height: 12.0,
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                  radius: 24.0,
                                  backgroundImage: NetworkImage('${urlWebSite}img/categories/${widget.image}')
                              ),
                              title: Row(
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Container(width: 200,child: Text(snapshot.data[index]['name'],textDirection: TextDirection.rtl)),
                                      Text(
                                        'SAR ${snapshot.data[index]['price']}' ,
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
                        ):
                        Column(
                          children: <Widget>[
                            Divider(
                              height: 12.0,
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                  radius: 24.0,
                                  backgroundImage: NetworkImage('${urlWebSite}img/categories/${snapshot.data[index]['image']}')
                              ),
                              title: Row(
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Container(width: 200,child: Text(snapshot.data[index]['name'],textDirection: TextDirection.rtl,style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),)),
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
                    itemCount: snapshot.data.length,
                  );
              },
            ),
          )
          ,
        ),
      );
  }
}

