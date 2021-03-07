import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:sree3app/Models/OrderModel.dart';
class Services {
  Services({this.dataOrder});
  final dataOrder ;
  static const String urlorder = 'https://merchants.sree3.com.sa/api/orders';


  static Future<List<Order>> getorder() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 44|SH2FabH80HI9qcILYqQiUglpj3fc8XaxN4FzzOr9'
      };
      http.Response response = await http.get(
        urlorder,
        headers: headers,
      );
     var Data = json.decode(response.body);
     var listorder= List<Order>() ;
      if (200 == response.statusCode) {
       // print(response.body);
        for(var x in Data){
          listorder.add(Order.fromJson(x));
        //  print('-----------------------');
        }
        print(listorder[1].amount.toString());
        return listorder;
      } else {
        return List<Order>();
      }
    } catch (e) {
      return List<Order>();
    }
  }



}