// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as https;


// class UserProvider with ChangeNotifier {
//   bool _isLoading = false;
//   bool get isLoading {
//     return _isLoading;
//   }

//   List<ProfileModel> _users = [];
//   List<ProfileModel> get users {
//     return [..._users];
//   }

//   String? currentUserId;
//   void setCurrentUserId(String userId) {
//     currentUserId = userId;
//     notifyListeners();
//   }

//   Future<void> getUserData({BuildContext? context}) async {
//     try {
//       _isLoading = true;
//       var response = await https.get(
//         Uri.parse(
//             "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_profile.php?user_id=$currentUserId"),
//       );

//       print(
//           "http://campus.sicsglobal.co.in/Project/PetAdoption/api/view_profile.php?user_id=$currentUserId");

//       print(response.body);

//       if (response.statusCode == 200) {
//         _isLoading = false;
//         _users.clear();
//         var extractedData = json.decode(response.body);
//         if (extractedData is Map<String, dynamic> &&
//             extractedData.containsKey('userDetails')) {
//           final userDetails = extractedData['userDetails'];
//           _users.add(
//             ProfileModel(
//               userid: userDetails['userid'].toString(),
//               firstname: userDetails['firstname'].toString(),
//               lastname: userDetails['lastname'].toString(),
//               email: userDetails['email'].toString(),
//               phone: userDetails['phone'].toString(),
//               address: userDetails['address'].toString(),
//               image: userDetails['photo'].toString(),
//               dob: userDetails['dob'].toString(),
//               gender: userDetails['gender'].toString(),
//             ),
//           );
//         }

//         print('product details' + _users.toString());
//         print('products loading completed --->' + 'loading data');
//         notifyListeners();
//       } else {
//         _isLoading = false;
//         notifyListeners();
//       }
//     } on HttpException catch (e) {
//       print('error in product prod -->>' + e.toString());
//       print('Product Data is one by one loaded the product' + e.toString());
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
