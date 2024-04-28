
import 'package:community_garden_coordinator/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/on.png'),fit: BoxFit.cover)),
        child: Column(
          children: [
      SizedBox(height: 80),
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 400),
            //   child: Image.asset('assets/H.png'),
            // ),
            
            Center(
              child: Text(' Community Garden ',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold,color: Colors.white)),
            ),
             Center(
              child: Text('Co-ordinator',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold,color: Colors.white)),
            ),
            Spacer(),
          //  SizedBox(height: 600),
            // const Padding(
            //   padding: EdgeInsets.only(top: 30, bottom: 30),
            //   // child: Text(
            //   //   "Welcome to our community garden, where seeds of connection, growth, and sustainability are planted, nurtured, and blossomed under the dedicated coordination of our passionate garden enthusiasts",
            //   //   textAlign: TextAlign.center
            //   // ),
            // ),
            /**/
           SizedBox(
            width: 180,
             child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: (){
                Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const LoginPage()));
              }, child:Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(IconlyBold.login,color: Colors.green,),
                SizedBox(width: 20),
                Text('Get Started',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
              ],
             )),
           )
          ],
        ),
      ),
    );
  }
}
