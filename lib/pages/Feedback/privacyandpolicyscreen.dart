import 'package:flutter/material.dart';

class PrivacyandPolicyScreen extends StatefulWidget {
  const PrivacyandPolicyScreen({super.key});

  @override
  State<PrivacyandPolicyScreen> createState() => _PrivacyandPolicyScreenState();
}

class _PrivacyandPolicyScreenState extends State<PrivacyandPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      
        backgroundColor: Colors.white,
        title: const Text('Privacy and Policy',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('How We Use Your Information:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
              const Text('We use your personal information to manage memberships, communicate with members, and organize community garden activities.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
              SizedBox(height: size.height*0.02),
                const Text('Information We Collect:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('We may also collect information about how you interact with our website or mobile app, including your IP address, browser type, and pages visited.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
               SizedBox(height: size.height*0.02),
              const Text('Information Sharing:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                const Text('We do not sell, trade, or rent your personal information to third parties',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                SizedBox(height: size.height*0.02),
                 const Text('Data Security:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('We implement appropriate security measures to protect your personal information from unauthorized access, alteration, or disclosure.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                    SizedBox(height: size.height*0.02),
                 const Text('Your Choices:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('You can update your personal information or communication preferences at any time by contacting us.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                     SizedBox(height: size.height*0.02),
                 const Text('Changes to this Privacy Policy:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('We may update this Privacy Policy from time to time to reflect changes in our practices or applicable laws. We will notify you of any significant changes by posting the updated policy on our website or mobile app.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                SizedBox(height: size.height*0.02),
              
            ]
            ,
          ),
        ),
      ),
    );
  }
}