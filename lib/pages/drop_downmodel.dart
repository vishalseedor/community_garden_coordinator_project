import 'package:flutter/material.dart';

class StateDetails {
  final String state;

  StateDetails({required this.state});

factory  StateDetails.fromJson(Map<String, dynamic> json) {
  return StateDetails(state: json['state']);
  }

}