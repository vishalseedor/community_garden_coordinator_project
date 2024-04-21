
import 'dart:convert';


import 'package:community_garden_coordinator/pages/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:http/http.dart' as http;


class RegisterationPage extends StatefulWidget {
   static const routeName = 'register_screen';
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {


  
  
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstnamecontroller=TextEditingController();
  TextEditingController lastnamecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController statecontroller =TextEditingController();
  TextEditingController citycontroller=TextEditingController();
  
  

 

  Future<void>registerCommunitygarden(

String firstname,String lastname,String email,String phone,String password,String state,String city) async {
  final url = 'http://campus.sicsglobal.co.in/Project/communitygarden/api/user_registration.php';

  Map<String, String> body = {
  
    'firstname':firstname ,
    'lastname': lastname,
     'email': email,
    'phone': phone,
    'password': password,
    'state':state,
    'city':city
   
   

    
   
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      
    );
      var jsonData=json.decode(response.body);

    if (response.statusCode == 200) {
         if(jsonData['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Color.fromARGB(255, 23, 77, 25),
          content: Text('Registration Successful!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: Duration(seconds: 4),
        ),
      );
      Navigator.push(context,MaterialPageRoute(builder:(context)=>const LoginPage()));
      print(body);
      print("Response body${response.body}");
    
      }
      print(body);
      print("Response body${response.body}");
      print('Registration successful');
      print(body);
      print("Response body${response.body}");
      print('Registration successful');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Color.fromARGB(255, 23, 77, 25),
          content: Text('Already email and password Exists',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: Duration(seconds: 4),
        ),
      );
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}


  @override
 Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //  const Spacer(),
                  // ConstrainedBox(
                  //   constraints: const BoxConstraints(maxWidth: 400),
                  //   child: Image.asset('assets/onboarding.png'),
                  // ),
                  SizedBox(height: 50),
                //  const Spacer(),
                  Text('Signup',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                   SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Please enter your firstname';
                      }
                      else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    controller: firstnamecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                    hintStyle: TextStyle(color: Colors.black),
                    hintText:'First Name',prefixIcon: const Icon(IconlyBold.profile,color: Colors.green,),
                    fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                  SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter your lastname';
                          }
                          else{
                            return null;
                          }
                        },
                    keyboardType: TextInputType.text,
                    controller: lastnamecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                    hintStyle: TextStyle(color: Colors.black),
                    hintText:'Last Name',prefixIcon: const Icon(IconlyBold.profile,color: Colors.green,),
                    fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                   SizedBox(height: 20),
                   
                    TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Please enter your email';
                        }
                        else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller:emailcontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                     hintStyle: TextStyle(color: Colors.black),
                    hintText:'Email',prefixIcon: const Icon(IconlyBold.message,color: Colors.green,),
                    fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                    SizedBox(height: 20),
                   
                    TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your phone";
                        }
                        else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                    controller: phonecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),hintText:'Phone',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: const Icon(IconlyBold.call,color: Colors.green,),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                  SizedBox(height: 20),
                   TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your password";
                        }
                        else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                    controller: passwordcontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                    hintStyle: TextStyle(color: Colors.black),
                    hintText:'Password',prefixIcon: const Icon(IconlyBold.password,color: Colors.green,),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                   SizedBox(height: 20),
                    TextFormField(
                        validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your state";
                        }
                        else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                    controller: statecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                      hintStyle: TextStyle(color: Colors.black),
                    hintText:'State',prefixIcon: const Icon(IconlyBold.location,color: Colors.green,),
                    fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                   SizedBox(height: 20),
                   TextFormField(
                        validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your city";
                        }
                      },
                      keyboardType: TextInputType.text,
                    controller: citycontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                      hintStyle: TextStyle(color: Colors.black),
                    hintText:'City',prefixIcon: const Icon(IconlyBold.location,color: Colors.green,),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                   
                  // Demo(),
              
                   
                       
                
                  /**/ const SizedBox(height: 40),
                  Center(
                    child: FilledButton.tonalIcon(
                      onPressed: ()async {
                    //        Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => LoginPage(),
                    //   ),
                    // );
                         if (_formKey.currentState!.validate()) {
                                  registerCommunitygarden(
                       firstnamecontroller.text.toString(),
                       lastnamecontroller.text.toString(),
                       emailcontroller.text.toString(),
                       phonecontroller.text.toString(),
                       passwordcontroller.text.toString(),
                       statecontroller.text.toString(),
                       citycontroller.text.toString()
                      
                       
                      
                
                 );


                 
                  }  

                    //  Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const HomePage()));
                      },
                      icon: const Icon(IconlyLight.login),
                      label: const Text('Register',style: TextStyle(fontWeight: FontWeight.bold),),
                    
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}