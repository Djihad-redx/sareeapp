
import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sree3app/pages/Cart.dart';
import 'package:sree3app/pages/card_Detail.dart';
import 'package:sree3app/pages/print_page.dart';
import 'package:sree3app/pages/sjil.dart';
import 'package:woocommerce/woocommerce.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sree3app/widget/drawer.dart';
import 'package:http/http.dart' as http;

import '../globals.dart';
import '../main.dart';
import 'TimerCode.dart';
import 'login.dart';
String baseUrl = "https://sree3.com.sa/";
String consumerKey = "ck_1c99dcd629e750b54eb416f7064982665b274b34";
String consumerSecret = "cs_8f7c18f423b4b16ab44a6a20325899fac22e9a60";

class YarabAP extends StatefulWidget {
  final Map<String,dynamic>  product ;
  final int index;
  YarabAP(this.product,this.index);
  @override
  _YarabState createState() => _YarabState();
}

class _YarabState extends State<YarabAP> with WidgetsBindingObserver{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final LocalStorage storage = new LocalStorage('Sare3_App');
  final deviceTypes = ['1',
    '2',
    '3',
    '4',
    '5',];
  String currentSelectedValue="1";
  String dropdownValue='1';
  List<WooProduct> products = [];
  List<WooProduct> featuredProducts = [];


  /*Future<List<Map<String,dynamic>>> getCard() async {
    Map<String,dynamic> body1={
      "amount":(widget.product["price"]*int.parse(currentSelectedValue)).toString(),
      "details": [{"productId": widget.product["id"].toString(), "amount": int.parse(currentSelectedValue)}]
    };
    var bod=jsonEncode(body1);
    print("Body ${bod}");
    print("Token ${Token}");
    var url = urlWebSite+'api/order';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,body:bod,headers: {'content-type':'application/json','Accept':'application/json', 'Authorization':"Bearer ${Token}"});

    try{
      List data=jsonDecode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => card_Detail(data)),
      );
      return data;
    }catch(e){ print(e);
    return null;

    }
  }*/
  Future<int> getCart()async{
    final ready = await storage.ready;
    if (ready) {
      Map<String,dynamic> item= await storage.getItem("cart");
      setState(() {
        TotalItem.value=item.length;
        print(TotalItem.value);
        storage.setItem("TotlaItem", TotalItem.value.toInt());
      });

    }

  }
  AddToCart()async{
    if(widget.product["price"]!=0){
      Map<String,dynamic> item=await storage.getItem("cart");
      if(item==null){
        item=new Map<String,dynamic>();
        item[widget.product["id"].toString()]={"idProd": widget.product["id"],"priceProd": widget.product["price"],
          "NumberProd": int.parse(currentSelectedValue),"Name": widget.product["name"],};
        debugPrint("add One");
      }else{
        item[widget.product["id"].toString()]={"idProd": widget.product["id"],"priceProd": widget.product["price"],
          "NumberProd": int.parse(currentSelectedValue),"Name": widget.product["name"],};
        debugPrint("add Multi");
      }
      await storage.setItem('cart', item);

      getCart();
    }else{
      // final snackBar = SnackBar(
      //   content: Text('تاكد من اختيار المنتج'),
      //   action: SnackBarAction(
      //     label: 'موافق',
      //     onPressed: () {
      //       // Some code to undo the change.
      //     },
      //   ),
      // );
      // _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  final navigatorKey = GlobalKey<NavigatorState>();
  void _initializeTimer() {
    if (TimerCode.timer!= null) {
      TimerCode.timer.cancel();
    }
    TimerCode.timer = Timer(const Duration(seconds: 60), handleTimeout);
  }
  void _logOutUser() {
    TimerCode.timer?.cancel();
    TimerCode.timer = null;

  }
  void _handleUserInteraction([_]) {
    _initializeTimer();
  }
  bool isFingerprint = false;
  var myPass = [1,2,3,4];
  void handleTimeout() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LockScreen(
        title: "This is Screet ",
        passLength: myPass.length,
        bgImage: "assets/bg.jpg",
        fingerPrintImage: "assets/fingerprint.png",
        showFingerPass: true,
        numColor: Colors.blue,
        fingerVerify: isFingerprint,
        borderColor: Colors.white,
        showWrongPassDialog: true,
        wrongPassContent: "Wrong pass please try again.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (passcode) async {
          for (int i = 0; i < myPass.length; i++) {
            if (passcode[i] != myPass[i]) {
              return false;
            }
          }
          return true;
        },
        onSuccess: () {
          Navigator.of(context).pop();
          setState(() {
            _initializeTimer();
          });
        }),));
  }
  bool ok = true;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _initializeTimer();
    super.initState();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _logOutUser();
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LockScreen(
          title: "This is Screet",
          passLength: myPass.length,
          bgImage: "assets/bg.jpg",
          fingerPrintImage: "assets/fingerprint.png",
          showFingerPass: true,
          numColor: Colors.blue,
          fingerVerify: isFingerprint,
          borderColor: Colors.white,
          showWrongPassDialog: true,
          wrongPassContent: "Wrong pass please try again.",
          wrongPassTitle: "Opps!",
          wrongPassCancelButtonText: "Cancel",
          passCodeVerify: (passcode) async {
            for (int i = 0; i < myPass.length; i++) {
              if (passcode[i] != myPass[i]) {
                return false;
              }
            }
            return true;
          },
          onSuccess: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp(),));
            setState(() {
              _logOutUser();
              _initializeTimer();
            });
          }),));
    }if (state == AppLifecycleState.paused){
      _logOutUser();
    }
  }
  @override
  Widget build(BuildContext contextt) {


    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _handleUserInteraction,
      onPanDown: _handleUserInteraction,
      child: Scaffold(
        backgroundColor: Colors.yellow.shade200,
        key: _scaffoldKey,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(widget.product["name"],style: TextStyle(color: Colors.black,)),
            backgroundColor: Color(0xfffed700),
            leading: Padding(
              padding: const EdgeInsets.only(left:12.0),
              child:
              InkWell(
                  onTap: (){
                    Navigator.of(contextt).push(MaterialPageRoute(builder: (context) => Cart(),));
                  },
                  child: Icon(Icons.shopping_cart,size: 35,color: Colors.black,)),

            ),
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
                 Text('اسم المنتج :  '+widget.product["name"],style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15,color: Colors.black ),textDirection: TextDirection.rtl),
                  SizedBox(height: 20),
                  Text('السعر :  '+ widget.product["price"].toString() + ' SAR',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15,color: Colors.black ) ,textDirection: TextDirection.rtl,),
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
                onTap: (){

                  _showMaterialDialog();
                },
                child: ListTile(
                  leading: Icon(Icons.print,color: Colors.black,size: 40,),
                  title: Row(
                    children: <Widget>[
                      Container(child: Text('اضف الى السلة',textDirection: TextDirection.rtl)),
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

                            Navigator.push(
                                contextt,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()),
                            );

                          },
                          child: ListTile(
                          leading: Icon(Icons.add_shopping_cart,color: Colors.black,size: 40,),
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
      ),
    );
  }
  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("تنفيد الطلب"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) =>
                 FlatButton(
                  child: Row(
                    children: [
                      Text('اغلاق',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )
          ],
          content: Row(
            children: [
              Expanded(child: Builder(
                builder: (context) =>
                InkWell(
                  onTap: (){
                    AddToCart();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp(),));

                },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 100,
                      decoration: BoxDecoration(
                          color:Color(0xfffed700),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Icon(Icons.shopping_bag_outlined,size: 50,color: Colors.black,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('متابعة التسوق',style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
              Expanded(child: Builder(
                builder: (context) =>
                 InkWell(onTap: (){
                   AddToCart();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Cart(),));
                },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5,right: 10),
                    child: Container(height: 100,
                      decoration: BoxDecoration(
                          color: Color(0xfffed700),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Icon(Icons.shopping_cart_outlined,size: 50,color: Colors.black,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text('تنفيد الطلب',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ));
  }
}


class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}
