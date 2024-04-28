import 'dart:convert';
import 'dart:io';
import 'package:community_garden_coordinator/pages/OrderProvider/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;


class OrderProvider extends ChangeNotifier {
  String? userid;
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<OrderModel> _orders = [];
  List<OrderModel> get orders {
    return [..._orders];
  }

  Future getAllOrdersData({BuildContext? context,String? userid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_my_orders.php?user_id=$userid"),
      );

      print(
            "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_my_orders.php?user_id=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _orders=[];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> orderDetails = extractedData['orders'];
        for (var i = 0; i < orderDetails.length; i++) {
          _orders.add(
            OrderModel(
              id: orderDetails[i]['id'].toString(),
              userId:  orderDetails[i]['user_id'].toString(),
              orderDate: orderDetails[i]['order_date'].toString(),
              packageId: orderDetails[i]['package_id'].toString(),
              packagename: orderDetails[i]['package_name'].toString(),
              description: orderDetails[i]['description'].toString(),
              price: orderDetails[i]['price'].toString(),
              status: orderDetails[i]['status'].toString(),
              image: orderDetails[i]['photo'].toString()


   
            ),
          );
        }
        ;

        print('product details' + _orders.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }

   Future<void> BookGardenPackage(
      {String? packageid, String? userid}) async {
    var body = {
      'package_id': packageid.toString(),
      'user_id': userid.toString(),
    
    };

    try {
      var response = await https.post(
          Uri.parse(
              'http://campus.sicsglobal.co.in/Project/communitygarden/api/book_package.php?package_id=$packageid&user_id=$userid'),
          body: body);

      if (response.statusCode == 200) {
        // Request successful
        print('Added to cart successfully');
        print('Response: ${response.body}');
      } else {
        // Request failed with error code
        print('Failed to add to cart. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception thrown during request
      print('Failed to add to cart. Exception: $e');
    }
  }




 
}


 
