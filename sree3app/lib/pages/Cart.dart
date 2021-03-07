import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import '../globals.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import 'TimerCode.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart> with WidgetsBindingObserver{
  static const platforme = MethodChannel("com.flutter.epic/epic");
  List<dynamic> res = new  List<dynamic>();
  Future<List> getCard() async {
    Map<String,dynamic> body1={
      "amount":Tot,
      "details": details
    };
    var bod=jsonEncode(body1);
    print("Body ${bod}");
    print("Token ${Token}");
    var url = urlWebSite+'api/order';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,body:bod,headers: {'content-type':'application/json','Accept':'application/json', 'Authorization':"Bearer ${Token}"});
    try{
      setState(() {
        storage.setItem('cart', null);
        storage.setItem('TotlaItem', null);
        TotalItem.value=0;
      });
      List data=jsonDecode(response.body);
      //print(data);
     // print('helooooooooooooooooooooooo');
     // Navigator.pop(context);
    }catch(e){ print(e);
    return null;

    }
  }
  final LocalStorage storage = new LocalStorage('Sare3_App');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double Tot=0;
  int TotItem=0;
  Map<String,dynamic> Allitem;
  List<Map<String,dynamic>> details=new List<Map<String,dynamic>>();
  Future<int> geTot()async{
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
  Future<Map<String,dynamic>> getCart()async{
    final ready = await storage.ready;
    if (ready) {
      Map<String,dynamic> item= await storage.getItem("cart");
      Allitem=item;
      item.forEach((key, value) {details.add({"productId": value["idProd"].toString(), "amount": value["NumberProd"]});});
     // print(details);
      return item;
    }else{
      return {};
    }
  }
  Future Total()async{
    Tot=0;
    var item =await getCart();
  //  print(item);
    if(item!=null){
      item.forEach((key, value) {
        setState(() {
          Tot=Tot+value["NumberProd"]*value["priceProd"];
        });
      });
    }
  }
  deleteItem(id)async{
    Map<String,dynamic> item=await storage.getItem("cart");
    if(item.length==1){
      setState(() {
        storage.setItem('cart', null);
        storage.setItem('TotlaItem', null);
        TotalItem.value=0;
      });
      Navigator.pop(context);
    }else{
      item.remove(id.toString());
      await storage.setItem("cart", item);
      getCart();
      Total();
      geTot();
    }

  }
  static const Color cl = Color(0xfffed700);
  Map<String,dynamic> itemList = Map<String,dynamic>();
  @override
  void initState(){
    getCart().then((value) {
      itemList = value;

    });
    super.initState();
    Total();
    WidgetsBinding.instance.addObserver(this);
    _initializeTimer();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.yellow.shade200,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('سلة المنتجات',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontFamily: 'DIN Next LT W23')),
          leading: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back,size: 30,)),
          backgroundColor: Color(0xfffed700),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getCart(),
                builder: (context, AsyncSnapshot<Map<String,dynamic>> snapshot) {
                  if (snapshot.data == null)
                    return new Container(
                      child: Center(child: new CircularProgressIndicator()),
                    );
                  else
                    return Container(
                      height: MediaQuery.of(context).size.height*0.8315,
                      width: MediaQuery.of(context).size.width,
                      child: MediaQuery.removePadding(context: context,removeTop: true, child: ListView.builder(
                        itemCount: snapshot.data.length,
                          itemBuilder: (context,i){
                            String key = snapshot.data.keys.elementAt(i);
                           res.add(snapshot.data);
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ],
                                    color: Colors.yellow.shade100,
                                    borderRadius: BorderRadius.all(Radius.circular(5))),
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(12,8,0,5),
                                      child: InkWell(onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (_) => new AlertDialog(
                                                title: new Text("حدف المنتج"),
                                                actions: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Builder(
                                                          builder: (context) =>
                                                           InkWell(
                                                            onTap: (){
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Text('اغلاق',style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.black
                                                            ),),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Builder(
                                                          builder: (context) =>
                                                           InkWell(
                                                            onTap: (){
                                                              deleteItem(snapshot.data[key]["idProd"]);
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Text('نعم',style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.black
                                                            ),),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                                content: Text('هل تريد حدف المنتج من السلة ؟')
                                            ));
                                      },
                                        child: Container(
                                            alignment: Alignment.topLeft,
                                            width:double.infinity,
                                            child: Icon(FontAwesomeIcons.trashAlt)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(right:20,bottom: 10,top: 10),
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:8.0),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(right:8.0),
                                                          child: Text(
                                                            '${snapshot.data[key]["Name"]}',textAlign: TextAlign.right,
                                                            style: TextStyle(
                                                              //fontWeight: FontWeight.bold,
                                                                fontSize: 15,
                                                                color: Colors.black, fontFamily: 'DIN Next LT W23'),
                                                          ),
                                                        ),
                                                        Text(
                                                          ':اسم المنتج',textAlign: TextAlign.right,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20,
                                                              color: Colors.black, fontFamily: 'DIN Next LT W23'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'SAR',textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20,
                                                          color: Colors.green, ),
                                                      ),
                                                      Text(
                                                          (snapshot.data[key]["priceProd"]).toStringAsFixed(2),textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Colors.green, fontFamily: 'DIN Next LT W23'),
                                                      ),
                                                      Text(
                                                        ':سعر المنتج',textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Colors.black, fontFamily: 'DIN Next LT W23'),
                                                      ),

                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:8.0),
                                                    child: Row(
                                                      children: [
                                                        /*Padding(
                                                          padding: const EdgeInsets.only(right:12.0),
                                                          child: InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                snapshot.data[key]["NumberProd"]++;
                                                              });
                                                            },
                                                            child: CircleAvatar(backgroundColor: cl,
                                                              child: Center(child: Icon(FontAwesomeIcons.plus,color: Colors.black,size: 27,)),
                                                            ),
                                                          ),
                                                        ),*/
                                                        Text(" العدد :${snapshot.data[key]["NumberProd"]}",style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Colors.black, fontFamily: 'DIN Next LT W23'
                                                        ),),
                                                        /*Padding(
                                                          padding: const EdgeInsets.only(left:12.0,right: 12),
                                                          child: InkWell(
                                                            onTap: (){
                                                              if(snapshot.data[key]["NumberProd"]>1){
                                                                setState(() {
                                                                  snapshot.data[key]["NumberProd"]--;
                                                                });


                                                              }
                                                            },
                                                            child: CircleAvatar(backgroundColor: cl,
                                                              child: Center(child: Icon(FontAwesomeIcons.minus,color: Colors.black,size: 30,)),
                                                            ),
                                                          ),

                                                        ),*/
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                    );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color:Colors.yellow.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              height:90,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text('المجموع',style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, fontFamily: 'DIN Next LT W23'
                          ),),
                        ),
                        Text('${Tot}',style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(onTap: (){
                        Payment();
                      },
                        child: Container(
                          height: 70,
                        decoration: BoxDecoration(
                            color: cl,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left:8.0),
                                    child: Icon(Icons.shopping_cart,color: Colors.black,size: 35,),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding:  EdgeInsets.only(right:30.0),
                                  child: Text('تاكيد الطلب',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.black, fontFamily: 'DIN Next LT W23'
                                  ),textAlign: TextAlign.end,),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              ],
            ),
            )
          ],
        )
      ),
    );
  }
  void Payment() async {
    String price = '80';
  var value;
    try{
     value = await platforme.invokeMethod('payment',itemList);
      print('ok!');
    }catch(e){
      print(e);
    }
  }
  void _initializeTimer() {
    if (TimerCode.timer!= null) {
      TimerCode.timer.cancel();
    }
    TimerCode.timer = Timer(const Duration(seconds: 180), handleTimeout);
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
  _showMaterialDialogg() {
    ;
  }
}

