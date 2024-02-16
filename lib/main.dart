
import 'package:community_garden_coordinator/pages/drop_down.dart';
import 'package:community_garden_coordinator/pages/onboarding_page.dart';
import 'package:community_garden_coordinator/pages/product_details_page.dart';
import 'package:community_garden_coordinator/pages/registerationpage.dart';
import 'package:community_garden_coordinator/provider/CategoryProvider/allcategoryscreen.dart';
import 'package:community_garden_coordinator/provider/ViewPackageProvider/allgardensscreen.dart';
import 'package:community_garden_coordinator/provider/ViewPackageProvider/viewpackageprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'provider/CategoryProvider/categoryprovider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>GardenProvider()),
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
        ChangeNotifierProvider(create: (context)=>StateDropDownProvider())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          textTheme: GoogleFonts.nunitoTextTheme(),
        ),
        home: const OnboardingPage(),
        routes: {
            'all_garden_screen': (context) => const AllGardenScreen(),
          'garden_details_screen': (context) {
           String id = ModalRoute.of(context)!.settings.arguments.toString();
           return GardenDetailsPage(
           id: id,
    );
  },
      'all_category_screen':(context) => const AllCategoryScreen(),
      'register_screen':(context) => const RegisterationPage()

         
  },
        
      ),
    );
  }
}
