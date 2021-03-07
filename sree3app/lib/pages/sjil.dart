
import 'package:share/share.dart';
import 'package:flutter/material.dart';

import 'package:sree3app/widget/drawer.dart';

class Sjil extends StatefulWidget {
  @override
  _SjilState createState() => _SjilState();
}

class _SjilState extends State<Sjil> {
  DateTime data = DateTime.now();
  DateTime data2 = DateTime.now();

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
       initialDate: data,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null && picked != data){
      setState(() {
        data=picked;
        print(data.toString());
      });
    }
  }
  Future<Null> selectTimePicker2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: data2,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null && picked != data2){
      setState(() {
        data2=picked;
        print(data2.toString());
      });
    }
  }
  String dropdownValue = 'All';
  String dropdownValue2 = 'لا شيء';
  String dropdownValue3 = 'لا شيء';
  String dropdownValue4 = '           موجز';
  final deviceTypes = ['لا شيء',
    'اكتمل - الكل',
    'اكتمل - اطبع',
    'اكتمل - اكد الطباعة',
    'اكتمل - لم يطبع',
    'اكتمل - اعادة طباعة',
    'اكتمل - اكد اعادة طباعة',
    'اكتمل - لم يعد طباعة',
    'فشل - الكل',];
  final deviceTypes1 = ['لا شيء',
    'اكتمل - الكل',
    'اكتمل - اطبع',
    'اكتمل - اكد الطباعة',
    'اكتمل - لم يطبع',
    'اكتمل - اعادة طباعة',
    'اكتمل - اكد اعادة طباعة',
    'اكتمل - لم يعد طباعة',
    'فشل - الكل',];
  final deviceTypes2 = [' موجز',
    'مفصل',
    ' تسوية',];
  var currentSelectedValue;
  var currentSelectedValue1;
  var currentSelectedValue2;
  String text = 'https://medium.com/@suryadevsingh24032000';
  String subject = 'ارسل العمليات';

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
            'السجلات', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xfffed700),
      ),
      backgroundColor: Color(0xfffed700),
      body: Container(
      //  width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Text('من تاريخ',style: TextStyle(fontSize: 30,fontFamily: 'DIN Next LT W23'),),

                SizedBox(height: 10,),
                Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: Colors.white,
                  child: ListTile(

                    title: Text(

                      data2.day.toString()+'/'+ data2.month.toString()+'/'+data2.year.toString(),textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'DIN Next LT W23',
                      ),
                    ),
                    onTap: () => selectTimePicker2(context),

                  ),
                ),
                SizedBox(height: 10,),
                Text('الى تاريخ',style: TextStyle(fontSize: 30,fontFamily: 'DIN Next LT W23'),),
                Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: Colors.white,
                  child: ListTile(

                    title: Text(
                      data.day.toString()+'/'+ data.month.toString()+'/'+data.year.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'DIN Next LT W23',
                      ),textAlign: TextAlign.center,
                    ),
                    onTap: () => selectTimePicker(context),

                  ),
                ),

                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: FormField<String>(
                //     builder: (FormFieldState<String> state) {
                //       return InputDecorator(
                //         decoration: InputDecoration(
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(5.0))),
                //         child: DropdownButtonHideUnderline(
                //           child: DropdownButton<String>(
                //             hint: Text("Select Device"),
                //             value: currentSelectedValue,
                //             isDense: true,
                //             onChanged: (newValue) {
                //               setState(() {
                //                 currentSelectedValue = newValue;
                //               });
                //               print(currentSelectedValue);
                //             },
                //             items: deviceTypes.map((String value) {
                //               return DropdownMenuItem<String>(
                //                 value: value,
                //                 child: Text(value),
                //               );
                //             }).toList(),
                //           ),
                //         ),
                //       );
                //     },
                //   ),),
                //   // child: DropdownButton<String>(
                //   //   value: dropdownValue,
                //   //   icon: Icon(Icons.arrow_downward),
                //   //   iconSize: 24,
                //   //   elevation: 16,
                //   //   style: TextStyle(color: Colors.deepPurple),
                //   //   underline: Container(
                //   //     height: 2,
                //   //     color: Colors.deepPurpleAccent,
                //   //   ),
                //   //   onChanged: (String newValue) {
                //   //     setState(() {
                //   //       dropdownValue = newValue;
                //   //     });
                //   //   },
                //   //   items: <String>[
                //   //     'All',
                //   //     'dd',
                //   //     '3',
                //   //     '4',
                //   //     '5',
                //   //     ''
                //   //     // '6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50'
                //   //   ]
                //   //       .map<DropdownMenuItem<String>>((String value) {
                //   //     return DropdownMenuItem<String>(
                //   //       value: value,
                //   //       child: Text(value, textAlign: TextAlign.center,),
                //   //     );
                //   //   }).toList(),
                //   //
                //   //
                //   // ),
                // ),
                // Row(
                //
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //
                //
                //           Text(data.day.toString()+'/'+ data.month.toString()+'/'+data.year.toString(),style:
                //           TextStyle(fontSize: 30),),
                //     SizedBox(width: 70,),
                //     RaisedButton(onPressed: () {
                //       selectTimePicker(context);
                //
                //     },
                //         child: Text(
                //           'من تاريخ',
                //           style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                //         ),
                //       color:Color(0xfffed700) ,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(18.0)),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 30,),
                // Row(
                //
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //
                //
                //     Text(data2.day.toString()+'/'+ data2.month.toString()+'/'+data2.year.toString(),style:
                //       TextStyle(fontSize: 30),),
                //     SizedBox(width: 70,),
                //     RaisedButton(onPressed: () {
                //       selectTimePicker2(context);
                //
                //     },
                //
                //         child: Text(
                //           'الى تاريخ',
                //           style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                //         ),
                //       color:Color(0xfffed700) ,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(18.0),
                //
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 30,),

                SizedBox(height: 20,),
                Text(':نوع البيان ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'DIN Next LT W23' ),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(

                        decoration: InputDecoration(
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(15.0))),
                        child: DropdownButtonHideUnderline(


                          child: DropdownButton<String>(

                            hint: Text("نوع البيان"),
                            value: currentSelectedValue1,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                currentSelectedValue1 = newValue;
                              });
                              print(currentSelectedValue1);
                            },
                            items: deviceTypes2.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(fontFamily: 'DIN Next LT W23',)),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),),
                SizedBox(height: 20,),
                Text(': تصنيف ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, fontFamily: 'DIN Next LT W23',),),
                Container(

                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {

                      return InputDecorator(

                        decoration: InputDecoration(

                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(15.0))),
                        child: DropdownButtonHideUnderline(

                          child: DropdownButton<String>(
                            hint: Text("تصنيف"),
                            value: currentSelectedValue2,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                currentSelectedValue2 = newValue;
                              });
                              print(currentSelectedValue2);
                            },
                            items: deviceTypes.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(fontFamily: 'DIN Next LT W23',)),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),),
                SizedBox(height: 20,),
                Text(': نوع العملية',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'DIN Next LT W23', ),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("نوع العملية"),
                            value: currentSelectedValue,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                currentSelectedValue = newValue;
                              });
                              print(currentSelectedValue);
                            },
                            items: deviceTypes1.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(fontFamily: 'DIN Next LT W23',)),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),),




                SizedBox(height: 20,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(onPressed: (){final RenderBox box = context.findRenderObject();
                      Share.share(text,
                          subject: subject,
                          sharePositionOrigin:
                          box.localToGlobal(Offset.zero) &
                          box.size);},child: Text('إرسل',style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                        color:Colors.white ,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),),
                      RaisedButton(onPressed: (){Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sjil()),(Route<dynamic> route) => false
                      );},child: Text('إعادة تعين',style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                        color:Colors.white ,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),),
                      RaisedButton(onPressed: (){},child: Text('اطبع',style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                        color:Colors.white ,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),),
                    ],
                  ),
                ),
                SizedBox(height: 60,),
                Container(
                  width: 220,
                  child: Image.asset('assets/imge/logos/header.png'),

                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(),
    color: Colors.white,
    borderRadius: BorderRadius.circular(18.0)

  );
}