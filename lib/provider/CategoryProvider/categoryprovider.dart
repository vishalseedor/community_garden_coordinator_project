import 'dart:convert';
import 'dart:io';

import 'package:community_garden_coordinator/provider/CategoryProvider/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;


class CategoryProvider with ChangeNotifier {
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

  List<CategoryDetails> _categories = [];
  List<CategoryDetails> get categories {
    return [..._categories];
  }

  Future getAllCategoryData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_package_category.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_package_category.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _categories = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> categoryDetails = extractedData['category_details'];
        for (var i = 0; i < categoryDetails.length; i++) {
          _categories.add(
            CategoryDetails(
              categoryId: categoryDetails[i]['category_id'].toString(),
              category: categoryDetails[i]['category'].toString(),
              categoryimage: categoryDetails[i]['photo'].toString()
           
            ),

          );
        }
        ;

        print('garden details' + _categories.toString());
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
 
}