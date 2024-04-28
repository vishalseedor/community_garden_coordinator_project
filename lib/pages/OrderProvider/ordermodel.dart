import 'package:flutter/material.dart';
class OrderModel {
  final String id;
  final String packageId;
  final String packagename;
  final String price;
  final String description;
  final String userId;
  final String status;
  final String orderDate;
  final String image;

  OrderModel(
      {required this.id,
      required this.packageId,
      required this.packagename,
      required this.price,
      required this.description,
      required this.userId,
      required this.status,
      required this.orderDate,
      required this.image
      });

factory OrderModel.fromJson(Map<String, dynamic> json) {
  return OrderModel( id : json['id'],
    packageId : json['package_id'],
    packagename: json['package_name'],
    price: json['price'],
    description: json['description'],
    userId : json['user_id'],
    status : json['status'],
    orderDate : json['order_date'],
    image: json['photo']
    );
  
   
  }}