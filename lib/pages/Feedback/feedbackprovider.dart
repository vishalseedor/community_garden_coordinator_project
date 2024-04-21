
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class FeedbackProvider extends ChangeNotifier {

  Future  addFeedback({String? userId, String? comments}) async {
    String apiUrl = 'http://campus.sicsglobal.co.in/Project/PetAdoption/api/add_feedback.php?user_id=$userId&message=$comments';
    var response = await http.post(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      
      // Handle success
      print('Feedback added successfully');
    } else {
      // Handle errors
      print('Failed to add feedback. Error: ${response.statusCode}');
    }
  }
}

