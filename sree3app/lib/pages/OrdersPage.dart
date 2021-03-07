import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:sree3app/Models/OrderModel.dart';
import 'package:sree3app/widget/drawer.dart';


import '../main.dart';
import 'package:flutter/services.dart';

import 'Cart.dart';
import 'OrderDetaill.dart';
import 'Services.dart';
import 'TimerCode.dart';


class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}
class _OrderPageState extends State<OrderPage> with WidgetsBindingObserver {
//----------------------timer--------------------------

  void _initializeTimer() {
    if (TimerCode.timer != null) {
      TimerCode.timer.cancel();
    }

    TimerCode.timer = Timer(const Duration(seconds: 20), handleTimeout);
  }

  void _handleUserInteraction([_]) {
    _initializeTimer();
  }
//----------------------timer--------------------------

  bool isFingerprint = false;
  Color cl = Color(0xfffed700);
  List<String> listOfCategory = [
    'مكتمل',
    'فشل',
  ];
  var myPass = [1,2,3,4];
  String selectedIndexCategory='مكتمل';
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
   // _initializeTimer();
    Services.getorder().then((value) {
      setState(() {
        lst = value;
      });
      setState(() {
        isloading = false;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    TimerCode().logOutUser();
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
              TimerCode().logOutUser();
              _initializeTimer();
            });
          }),));
    }if (state == AppLifecycleState.paused){
      TimerCode().logOutUser();
    }
  }
 List<Order> lst = new List<Order>();
 bool isloading = true;
    @override

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _handleUserInteraction,
        onPanDown: _handleUserInteraction,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          endDrawer: AppDrawer(),
          appBar: AppBar(
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.only(right:8.0),
            //     child: InkWell(onTap:(){
            //     },child: Icon(Icons.menu_sharp,size: 35,)),
            //   )
            // ],
            iconTheme: IconThemeData(color: Colors.black),
            title: Text('سجل الطلبات',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            leading: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart(),));
                },
                child: Icon(Icons.shopping_cart,size: 30,)),
            backgroundColor: Color(0xfffed700),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top:5),
                color: cl,
                child: Center(child: Text('سجل الطلبات',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),)),
              ),
              Container(
                color: cl,
                height: 10,
              ),
              Container(
                color: cl,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          height: 40,
                          child: Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:8.0,top: 15),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'رقم الطلب',
                                      hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:5.0),
                                child: Icon(Icons.search),
                              )
                            ],
                          ),

                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          height: 40,
                          child:     Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            child: Container(
                              margin: EdgeInsets.only(left: 16, right: 16),
                              child: DropdownButton(
                                isExpanded: true,
                                value: selectedIndexCategory,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),

                                icon: Icon(Icons.keyboard_arrow_down),
                                underline: Container(color: Colors.transparent),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedIndexCategory = newValue;
                                  });
                                },
                                items: listOfCategory.map((category) {
                                  return DropdownMenuItem(
                                    child: Container(
                                        margin: EdgeInsets.only(left: 4,right: 4),
                                        child: Text(category,style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                                    value: category,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: cl,
                child: Row(
                  children: [
                    Expanded(child: Center(
                    child: Text('التفاصيل',style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                    ),),
                  )),
                    Expanded(child: Center(
                      child: Text('الحالة',style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      ),),
                    )),
                    Expanded(child: Center(
                      child: Text('السعر',style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      ),),
                    )),
                    Expanded(child: Center(
                      child: Text('التاريخ',style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      ),),
                    )),
                    Expanded(child: Center(
                      child: Text('رقم الطلب',style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      ),),
                    )),
                ],),
              ),
              Container(
                color: cl,
                height: 10,
              ),
              Expanded(
               child:isloading ==false? ListView.builder(
                 itemCount: lst.length,
                itemBuilder: (context, index) {

                  return orderwidget(
                    Amountorder: lst[index].amount.toString(),
                    DateOrder: lst[index].createdAt.toString(),
                    OrderID: lst[index].id.toString(),
                    StateOrder: lst[index].status.toString(),
                  );
                },
               ): Center(
                 child: CircularProgressIndicator(),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}

class orderwidget extends StatelessWidget {
  orderwidget({this.OrderID,this.DateOrder,this.Amountorder,this.StateOrder});
  String OrderID;
  String DateOrder;
  String Amountorder;
  String StateOrder;

  Color cl = Color(0xfffed700);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        children: [
          Expanded(child: Container(
            color: Colors.yellow.shade50,
            child: Center(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDettail()));

                },
                child: Container(
                  padding: EdgeInsets.only(right: 15,left: 15),
                  decoration: BoxDecoration(
                      color: cl,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text('التفاصيل',style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
          )),
          Expanded(child: Container(
            color: Colors.yellow.shade50,
            child: Center(
              child: Text(StateOrder=='1'?'مكتمل':'فشل',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
              ),),
            ),
          )),
          Expanded(child: Container(
            color: Colors.yellow.shade100,
            child: Center(
              child: Text(Amountorder,style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
              ),),
            ),
          )),
          Expanded(child: Container(
            color: Colors.yellow.shade50,
            child: Center(
              child: Text(DateOrder,style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold
              ),),
            ),
          )),
          Expanded(child: Container(
            color: Colors.yellow.shade100,
            child: Center(
              child: Text(OrderID,style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
              ),),
            ),
          )),
        ],),
    );
  }
}
