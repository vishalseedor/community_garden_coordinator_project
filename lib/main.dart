import 'package:community_garden_coordinator/Helpers/providers.dart';
import 'package:community_garden_coordinator/Helpers/routes.dart';
import 'package:community_garden_coordinator/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:multiprovider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Community Garden',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor:Colors.green),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        routes: customRoutes
          
          
      ),
    );
  }
}
