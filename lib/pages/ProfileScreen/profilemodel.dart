import 'package:flutter/material.dart';

class ProfileModel {
  final String userid;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String photo;
  final String state;
  final String city;

  ProfileModel(
      {required this.userid,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.photo,
      required this.state,
      required this.city});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel( 
    userid : json['userid'],
    firstname : json['firstname'],
    lastname : json['lastname'],
    email : json['email'],
    phone : json['phone'],
    photo : json['photo'],
    state : json['state'],
    city : json['city']);
   
  }}