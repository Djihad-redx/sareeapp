

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sree3app/pages/Cart.dart';
import 'package:sree3app/proudect_All/OneProduct.dart';
import 'package:sree3app/proudect_cinama/nteflixuae.dart';
import 'package:sree3app/widget/drawer.dart';
import 'package:http/http.dart' as http;

import '../globals.dart';


class AllCategory extends StatefulWidget{
  String Name;
  int id;
  AllCategory(this.id,this.Name);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }


}

class _State extends State<AllCategory>{
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
    // TODO: implement initState
    super.initState();
    getChildProduct();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      MaterialApp(
debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.yellow.shade200,
          endDrawer: AppDrawer(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(widget.Name,style: TextStyle(color: Colors.black)),
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
          body:
          Container(
              width: double.infinity,
              child:FutureBuilder(
                future: getChildProduct(),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.data == null)
                    return new Container(
                      child: Center(child: new CircularProgressIndicator()),
                    );
                  else
                    return Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8,top: 8),
                      child: GridView.builder(
                        itemCount: snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:2),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: new Container(

                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                  color: Colors.yellow.shade200,
                                borderRadius: BorderRadius.all(Radius.circular(1))
                              ),
                             // elevation: 6.0,

                              child: Hero(
                                tag: Text('test'),
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OneProduct(snapshot.data[index]['id'], snapshot.data[index]['name'],image: snapshot.data[index]['image'],)),
                                      );
                                    },
                                    child: GridTile(
                                      footer: Container(
                                        //color: Colors.white70,
                                        child: ListTile(
                                          title: Text(
                                            snapshot.data[index]['name'],
                                            style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center ,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            child: Image.network("${urlWebSite}img/categories/${snapshot.data[index]['image']}", fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );


                },
              ),
          ),
        ),
      );
  }

}