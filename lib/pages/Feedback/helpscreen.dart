import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Help',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Help',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                Image.asset('assets/help.png',scale: 1),
                SizedBox(height: size.height*0.02),
                Text("Welcome to our mobile app! Whether you're a new user or a seasoned pro, we're here to ensure you have the best experience possible. If you have any questions or encounter any issues while using our app, our dedicated support team is just a message away. Explore our comprehensive FAQs for quick answers to common queries,Thank you for choosing our app, and happy exploring!")
            ],
          ),
        ),
      ),
    );
  }
}