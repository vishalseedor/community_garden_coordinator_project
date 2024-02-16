import 'dart:convert';


import 'package:community_garden_coordinator/pages/demo_dropdown.dart';
import 'package:community_garden_coordinator/pages/drop_down.dart';
import 'package:community_garden_coordinator/pages/drop_downmodel.dart';
import 'package:community_garden_coordinator/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class RegisterationPage extends StatefulWidget {
   static const routeName = 'register_screen';
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  List<String> _states = [];
  String? stateDropDownvalue;

    @override
  void initState() {
    Provider.of<StateDropDownProvider>(context, listen: false).StateDropdownApi();    
    super.initState();
  }
 
  
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstnamecontroller=TextEditingController();
  TextEditingController lastnamecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();

  Future<void>registerCommunitygarden(

String firstname,String lastname,String password,String email,String phone) async {
  final url = 'http://campus.sicsglobal.co.in/Project/communitygarden/api/user_registration.php';

  Map<String, String> body = {
  
    'firstname':firstname ,
    'lastname': lastname,
    'password': password,
    'email': email,
    'phone': phone,
    
   
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      
    );

    if (response.statusCode == 200) {
      print(body);
      print("Response body${response.body}");
      print('Registration successful');
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}


  @override
 Widget build(BuildContext context) {
   final stateDropDown = Provider.of<StateDropDownProvider>(context);
    List<StateDetails> stateDropDownvalue = [];
    stateDropDownvalue = stateDropDown.stateDropDown;
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
                    },
                    keyboardType: TextInputType.text,
                    controller: firstnamecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),hintText:'First Name',prefixIcon: const Icon(IconlyLight.profile),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                  SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter your lastname';
                          }
                        },
                        keyboardType: TextInputType.text,
                      controller: lastnamecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),hintText:'Last Name',prefixIcon: const Icon(IconlyLight.profile),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                   SizedBox(height: 20),
                   
                    TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Please enter your password';
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordcontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),hintText:'Password',prefixIcon: const Icon(IconlyLight.password),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                    SizedBox(height: 20),
                   
                    TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your email";
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),hintText:'Email',prefixIcon: const Icon(IconlyLight.message),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                   SizedBox(height: 20),
                    TextFormField(
                        validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your mobile no";
                        }
                      },
                      keyboardType: TextInputType.phone,
                    controller: phonecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),hintText:'Mobile No',prefixIcon: const Icon(IconlyLight.call),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                  ),
                   SizedBox(height: 20),
                   
                   Demo(),
              
                   
                       
                
                  /**/ const SizedBox(height: 40),
                  Center(
                    child: FilledButton.tonalIcon(
                      onPressed: ()async {
                    //        Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => LoginPage(),
                    //   ),
                    // );
                //          if (_formKey.currentState!.validate()) {
                // //                   registerCommunitygarden(
                // //        firstnamecontroller.text.toString(),
                // //        lastnamecontroller.text.toString(),
                // //        passwordcontroller.text.toString(),
                // //        phonecontroller.text.toString(),
                // //        emailcontroller.text.toString(),
                      
                
                // //  );


                 
                //   }  

                      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const HomePage()));
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