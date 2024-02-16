import 'dart:convert';
import 'dart:io';
import 'package:community_garden_coordinator/pages/drop_downmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class StateDropDownProvider with ChangeNotifier{

  
  List<StateDetails> _stateDropDown = [];

  List<StateDetails> get stateDropDown {
    return _stateDropDown;
  }

  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  bool _isCustomerLoading = false;
  bool get isCustomerLoading {
    return _isCustomerLoading;
  }

  bool _isErrorLoading = false;
  bool get isErrorLoading {
    return _isErrorLoading;
  }

  bool _isCustomerErrorLoading = false;
  bool get isCustomerErrorLoading {
    return _isCustomerErrorLoading;
  }

  String? _errorMessage;
  String? get errorMessage {
    return _errorMessage;
  }

  Future StateDropdownApi() async {
    print('------');
    try {
      _isLoading = true;
   
      _stateDropDown = [];
      // var headers = {
      // 'Cookie': 'session_id=78fcf770c80d75ea87ab28fec0b98fb4a825c14d; session_id=edf89d64260706656486a72ddbe1751e737f42a9'
      // };
      print('1-----');
      var url =
          "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_all_states.php";
      print(url);
      var response = await https.get(Uri.parse(url));
      print(
          "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_all_states.php");
      var jsonData = json.decode(response.body);
      final List<dynamic> stateDetails = jsonData['state_details'];
      if (response.statusCode == 200) {
     
        for (var i = 0; i <stateDetails.length; i++) {
          _stateDropDown.add(StateDetails(
              state:stateDetails[i]['state'].toString() ,
             ));
        }
      

        _isLoading = false;
        notifyListeners();
      }
      print('response claim ${response.body}');
      return _stateDropDown;
    } on SocketException catch (e) {
      _isCustomerErrorLoading = true;
      _isCustomerLoading = false;
      _errorMessage = 'No Internet Connection';
      notifyListeners();
    } on HttpException {
      _isCustomerErrorLoading = true;
      _isCustomerLoading = false;
      _errorMessage = 'No Service Found';
      notifyListeners();
    } on FormatException {
      _isCustomerErrorLoading = true;
      _isCustomerLoading = false;
      _errorMessage = 'Invalid Data Format';
      notifyListeners();
    }
  
  }
}