import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDettail extends StatefulWidget {
  @override
  _OrderDettailState createState() => _OrderDettailState();
}

class _OrderDettailState extends State<OrderDettail> {
  Color cl = Color(0xfffed700);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow.shade50,
        appBar: AppBar(

          iconTheme: IconThemeData(color: Colors.black),
          title: Text('تفاصيل الطلب',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontFamily: 'DIN Next LT W23')),
          leading: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back,size: 30,)),
          backgroundColor: Color(0xfffed700),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: cl,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
              ),

              child: Column(
                children: [
                  Container(
                    color: cl,
                    child: Center(child: Text('تفاصيل الطلب',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DIN Next LT W23',
                      fontSize: 22,

                    ),)),
                  ),
                  Container(
                    color: cl,
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:15,left:15,top: 10),
                    child: Container(
                      padding: EdgeInsets.only(right:15,left:15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:20.0),
                            child: Text('98654785',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: 'DIN Next LT W23'
                            ),

                            ),
                          ),
                          Text(':رقم الطلب',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black,
                              fontFamily: 'DIN Next LT W23'
                          ),textAlign: TextAlign.end,)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:15,left:15,top: 5),
                    child: Container(
                      padding: EdgeInsets.only(right:15,left:15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Text('(KSA)',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: 'DIN Next LT W23'
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Text('24-02-2021',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: 'DIN Next LT W23'
                            ),
                            ),
                          ),
                          Text(':تاريخ الطلب',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black,
                              fontFamily: 'DIN Next LT W23'
                          ),
                            textAlign: TextAlign.end,)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:15,left:15,top: 5),
                    child: Container(
                      padding: EdgeInsets.only(right:15,left:15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:28),
                            child: Text('مكتمل',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black, fontFamily: 'DIN Next LT W23'
                            ),),
                          ),
                          Text(':حالة الطلب',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black, fontFamily: 'DIN Next LT W23'
                          ),
                            textAlign: TextAlign.end,)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:15,left:15,top: 5),
                    child: Container(
                      padding: EdgeInsets.only(right:15,left:15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:00),
                            child: Text('رصيد المحفظة',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black, fontFamily: 'DIN Next LT W23'
                            ),),
                          ),
                          Text(':طريقة الدفع',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black
                          ),textAlign: TextAlign.end,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,20,8,0),
                  child: Stack(
                    children: [
                      Container(
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                      Container(
                        height: 190,
                        width: MediaQuery.of(context).size.width*.7,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: cl,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:30.0,right: 25),
                              child: Text('(60UC) 1\$ Pubg بطاقة',style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'DIN Next LT W23'
                              ),textAlign: TextAlign.center,),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Padding(
                                padding: const EdgeInsets.only(right:15.0),
                                child: Text('01',style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange, fontFamily: 'DIN Next LT W23'
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:15.0),
                                child: Text(':العدد',style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, fontFamily: 'DIN Next LT W23'
                                ),),
                              ),
                            ],)
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top:10,
                        bottom: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              image: new DecorationImage(
                                image: new ExactAssetImage('images/05.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20),
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(10))
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:5.0),
                                child: Text('ر.س',style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, fontFamily: 'DIN Next LT W23'
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:5.0),
                                child: Text('615.5',style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, fontFamily: 'DIN Next LT W23'
                                ),),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          color: cl,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            Text(':رقم البطاقة',style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold, fontFamily: 'DIN Next LT W23'
                            ),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('FSXrL-AAETXAAGEXSeDBVN',style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold, fontFamily: 'DIN Next LT W23'
                              ),),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){

                            },
                            child: Icon(Icons.share,size: 35,)),
                      ),
                      Positioned(
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: (){

                              },
                              child: Icon(Icons.copy,size: 35,)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
