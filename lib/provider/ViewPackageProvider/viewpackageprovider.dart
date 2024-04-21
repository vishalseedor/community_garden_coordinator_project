import 'dart:convert';
import 'dart:io';

import 'package:community_garden_coordinator/provider/ViewPackageProvider/viewpackagemodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;


class GardenProvider with ChangeNotifier {
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

  List<GardenPackageModel> _gardens = [];
  List<GardenPackageModel> get gardens {
    return [..._gardens];
  }
   List<GardenPackageModel> _searchProducts = [];
  List<GardenPackageModel> get searchProducts {
    return [..._searchProducts];
  }

  List<GardenPackageModel> _filteredProducts = [];
  List<GardenPackageModel> get filteredProducts {
    return [..._filteredProducts];
  }

  Future getAllGardenData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_packages.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_packages.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _gardens = [];
         _filteredProducts = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> gardenDetails = extractedData['garden_package_details'];
        for (var i = 0; i < gardenDetails.length; i++) {
          _gardens.add(
            GardenPackageModel(
              packageId: gardenDetails[i]['package_id'].toString(),
              packageName: gardenDetails[i]['package_name'].toString(),
              description: gardenDetails[i]['description'].toString(),
              price: gardenDetails[i]['price'].toString(),
              area: gardenDetails[i]['area'].toString(), 
              unitType: gardenDetails[i]['unit_type'].toString(),
              daysRequired: gardenDetails[i]['days_required'].toString(),
              photo: gardenDetails[i]['photo'].toString(),
              phone: gardenDetails[i]['phone'].toString(),
              coordinatorId: gardenDetails[i]['coordinator_id'].toString(),
              userid: gardenDetails[i]['userid'].toString(),
              name: gardenDetails[i]['name'].toString(),
              email: gardenDetails[i]['email'].toString(),
              aboutCoordinator: gardenDetails[i]['about_coordinator'].toString(),
              address: gardenDetails[i]['address'].toString(),
              state: gardenDetails[i]['state'].toString(),
              city: gardenDetails[i]['city'].toString()

              
            ),

          );
        }
        ;

        print('garden details' + _gardens.toString());
        _isLoading = false;
        print('garden loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in garden prod -->>' + e.toString());
      print('Garden Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
  Future<void> getSearchData({dynamic value}) async {
    _isLoading = true;
    var response = await https.get(
      Uri.parse(
          "http://campus.sicsglobal.co.in/Project/communitygarden/api/search_package.php?keyword=$value"),
    );

    print(
        "http://campus.sicsglobal.co.in/Project/communitygarden/api/search_package.php?keyword=$value");

    if (response.statusCode == 200) {
      var responseBody = response.body;

        print(responseBody);

        _searchProducts = [];

        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> gardenDetails = extractedData['garden_package_details'];
        for (var i = 0; i < gardenDetails.length; i++) {
          _searchProducts.add(
              GardenPackageModel(
              packageId: gardenDetails[i]['package_id'].toString(),
              packageName: gardenDetails[i]['package_name'].toString(),
              description: gardenDetails[i]['description'].toString(),
              price: gardenDetails[i]['price'].toString(),
              area: gardenDetails[i]['area'].toString(), 
              unitType: gardenDetails[i]['unit_type'].toString(),
              daysRequired: gardenDetails[i]['days_required'].toString(),
              photo: gardenDetails[i]['photo'].toString(),
              phone: gardenDetails[i]['phone'].toString(),
              coordinatorId: gardenDetails[i]['coordinator_id'].toString(),
              userid: gardenDetails[i]['userid'].toString(),
              name: gardenDetails[i]['name'].toString(),
              email: gardenDetails[i]['email'].toString(),
              aboutCoordinator: gardenDetails[i]['about_coordinator'].toString(),
              address: gardenDetails[i]['address'].toString(),
              state: gardenDetails[i]['state'].toString(),
              city: gardenDetails[i]['city'].toString()

              
            ),
          );
        }

        print('product details search' + _searchProducts.toString());
        print('products loading completed --->' + 'loading data');
          _isLoading = false;
        notifyListeners();


    } else {
        _isLoading = false;
          notifyListeners();
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }

    _isLoading = false;
    notifyListeners();
  }
 
}