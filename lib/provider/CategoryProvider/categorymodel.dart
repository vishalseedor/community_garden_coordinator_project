import 'package:flutter/material.dart';

class CategoryDetails {
  final String categoryId;
  final String category;
  final String categoryimage;

  CategoryDetails({required this.categoryId,required this.category,required this.categoryimage});

 factory CategoryDetails.fromJson(Map<String, dynamic> json) {
   return CategoryDetails(
    categoryId: json['category_id'],
    category: json['category'],
    categoryimage: json['photo']
    );
  }}