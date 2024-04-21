import 'dart:convert';
import 'dart:io';
import 'package:community_garden_coordinator/pages/CategoryEachProvider/gardencategorymodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;


class CategoryEachProvider with ChangeNotifier {
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

  

  List<GardenPackageDetails> _package = [];
  List<GardenPackageDetails> get package {
    return [..._package];
  }
 

  Future getAllEachCategorysData({required BuildContext context,required String categorypackage}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_packages_by_category.php?category_id=$categorypackage"),
      );

      print(
             "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_packages_by_category.php?category_id=$categorypackage");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _package = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> packageDetails = extractedData['garden_package_details'];
        for (var i = 0; i < packageDetails.length; i++) {
          _package.add(
           GardenPackageDetails(
              packageId: packageDetails[i]['package_id'].toString(),
              packageName: packageDetails[i]['package_name'].toString(),
              description: packageDetails[i]['description'].toString(),
              price: packageDetails[i]['price'].toString(),
              area: packageDetails[i]['area'].toString(), 
              unitType: packageDetails[i]['unit_type'].toString(),
              daysRequired: packageDetails[i]['days_required'].toString(),
              photo: packageDetails[i]['photo'].toString(),
              phone: packageDetails[i]['phone'].toString(),
              coordinatorId: packageDetails[i]['coordinator_id'].toString(),
              userid: packageDetails[i]['userid'].toString(),
              name: packageDetails[i]['name'].toString(),
              email: packageDetails[i]['email'].toString(),
              aboutCoordinator: packageDetails[i]['about_coordinator'].toString(),
              address: packageDetails[i]['address'].toString(),
              state: packageDetails[i]['state'].toString(),
              city: packageDetails[i]['city'].toString()

              
            ),
          );
        }
        ;

        print('product details' + _package.toString());
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
 
}
  
 
