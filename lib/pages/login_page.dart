
import 'dart:convert';

import 'package:community_garden_coordinator/pages/ProfileScreen/profilemodel.dart';
import 'package:community_garden_coordinator/pages/ProfileScreen/userprovider.dart';
import 'package:community_garden_coordinator/pages/home_page.dart';
import 'package:community_garden_coordinator/pages/registerationpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    late bool _passwordVisible;
 

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void loginCoummityGarden(String email, String password) async {
    const url = 'http://campus.sicsglobal.co.in/Project/communitygarden/api/login.php';

    Map<String, String> body = {'email': email, 'password': password};

  try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(url);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(jsonData["status"]);
      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          //      getstorage.write("phone",loginModel!.phone.toString());
          // getstorage.write("password",loginModel!.password.toString());
          // getstorage.read(phone);
          // phone=getstorage.read("phone");

          List user = jsonData['userDetails'];
          if (user.isNotEmpty) {
            ProfileModel userdata = ProfileModel.fromJson(user[0]);
            String userId = userdata.userid;
            Provider.of<UserProvider>(context, listen: false)
                .setCurrentUserId(userId);
            print(userId);
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:  Color.fromARGB(255, 23, 77, 25),
              content: const Text(
                'Login Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage()));
          print(body);
          print("Response body${response.body}");

          print('Login successful');
        } else if (jsonData['status'] == false) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color.fromARGB(255, 23, 77, 25), 
              content: const Text(
                'Invalid email and password',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          print('Error: ${response.statusCode}');
        }
      } else {
        print('fffff');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

   @override
  void initState() {
    super.initState();
    _passwordVisible = false;
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
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Image.asset('assets/new.png'),
                  ),
                //  SizedBox(height: 20),
                //  const Spacer(),
                  Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                   SizedBox(height: 25),
                  TextFormField(
                    controller: emailcontroller, 
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                       hintStyle: TextStyle(color: Colors.black),
                    hintText:'Email',
                    prefixIcon: const Icon(IconlyBold.message,color: Colors.green,),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                    validator: (value) {
                      if(value!.isEmpty){
                      return 'Please enter your email';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                      TextFormField(
                        obscureText: _passwordVisible,
                      controller: passwordcontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                    hintStyle: TextStyle(color: Colors.black),
                    hintText:'Password',prefixIcon: const Icon(IconlyBold.password,color: Colors.green,),fillColor: Colors.grey.withOpacity(0.2),filled: true,
                     suffixIcon: IconButton(
                                  icon: Icon(
                                   
                                     _passwordVisible
                                     ? Icons.visibility
                                     : Icons.visibility_off,
                                     color: Colors.green
                                     ),
                                  onPressed: () {
                                 
                                     setState(() {
                                         _passwordVisible = !_passwordVisible;
                                     });
                                   },
                                  ),
                    ),
                      validator: (value) {
                      if(value!.isEmpty){
                      return 'Please enter your password';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                
                  /**/ SizedBox(height: 35),
                  Center(
                    child: FilledButton.tonalIcon(
                      onPressed: () {
                         if (_formKey.currentState!.validate()) {
                              loginCoummityGarden(
                                emailcontroller.text.toString(),
                                passwordcontroller.text.toString(),
                              );
                            }

                       // Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const RegisterationPage()));
                      },
                      icon: const Icon(IconlyLight.login),
                      label: const Text('Login',style: TextStyle(fontWeight: FontWeight.bold),),
                    
                    ),
                  ),
                  SizedBox(height: 10),
                   Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don t have  an account ?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          TextButton(onPressed: ()async{
                            Navigator.push(context,MaterialPageRoute(builder:(context)=>const RegisterationPage()));
                          }, child:Text('Register',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))),
                        ],
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