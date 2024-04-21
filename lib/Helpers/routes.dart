



import 'package:community_garden_coordinator/pages/CategoryEachProvider/categoryeachscreen.dart';
import 'package:community_garden_coordinator/pages/product_details_page.dart';
import 'package:community_garden_coordinator/pages/registerationpage.dart';
import 'package:community_garden_coordinator/pages/services_page.dart';
import 'package:community_garden_coordinator/provider/CategoryProvider/allcategoryscreen.dart';
import 'package:community_garden_coordinator/provider/ViewPackageProvider/allgardensscreen.dart';
import 'package:flutter/material.dart';


var customRoutes = <String, WidgetBuilder>{
    'all_garden_screen': (context) => const AllGardenScreen(),
          'garden_details_screen': (context) {
           String id = ModalRoute.of(context)!.settings.arguments.toString();
           return GardenDetailsPage(
           id: id,
    ); 
  },
      'all_category_screen':(context) => const ServicesPage(),
      'register_screen':(context) => const RegisterationPage(),
       'all_categorypackage_screen': (context) {
    var data = ModalRoute.of(context)!.settings.arguments;
    if (data is String) {
      return AllCategoryEachScreen(catepackage: data);
    } else if (data is Map<String, dynamic>) {
      return AllCategoryEachScreen(catepackage: data['category_id']);
    } else {
      print('Unexpected argument type: ${data.runtimeType}');
      return const Scaffold(
        body: Center(
          child: Text(''),
        ),
      );
    }
  },
    
};
