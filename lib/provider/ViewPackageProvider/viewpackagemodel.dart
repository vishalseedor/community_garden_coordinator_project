import 'package:flutter/material.dart';

class GardenPackageModel {
  final String packageId;
  final String packageName;
  final String description;
  final String price;
  final String area;
  final String unitType;
  final String daysRequired;
  final String photo;
//  List<Packagefinal Items> packageItems;
  final String coordinatorId;
  final String userid;
  final String name;
  final String phone;
  final String email;
  final String aboutCoordinator;
  final String address;
  final String state;
  final String city;

  GardenPackageModel(
      {required this.packageId,
     required this.packageName,
     required this.description,
     required this.price,
     required this.area,
     required this.unitType,
     required this.daysRequired,
     required this.photo,
    // required this.packageItems,
     required this.coordinatorId,
     required this.userid,
     required this.name,
     required this.phone,
     required this.email,
     required this.aboutCoordinator,
     required this.address,
     required this.state,
     required this.city}
     
     
     );
     
  factory GardenPackageModel.fromJson(Map<String, dynamic> json) {
    return GardenPackageModel(
    packageId:json['package_id'],
    packageName: json['package_name'],
    description: json['description'],
    price: json['price'],
    area: json['area'],
    unitType: json['unit_type'],
    daysRequired: json['days_required'],
    photo: json['photo'],
    coordinatorId: json['coordinator_id'],
    userid: json['userid'],
    name: json['name'],
    phone: json['phone'],
    email: json['email'],
    aboutCoordinator: json['about_coordinator'],
    address: json['address'],
    state: json['state'],
    city: json['city']

    );
   
  }
}
