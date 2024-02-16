
import 'package:community_garden_coordinator/pages/registerationpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //  const Spacer(),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Image.asset('assets/onboarding.png'),
                ),
                SizedBox(height: 50),
              //  const Spacer(),
                Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                 SizedBox(height: 20),
                TextField(
        
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),hintText:'Email',prefixIcon: const Icon(IconlyLight.message),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                ),
                SizedBox(height: 20),
                    TextField(
        
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),hintText:'Password',prefixIcon: const Icon(IconlyLight.password),fillColor: Colors.grey.withOpacity(0.2),filled: true),
                ),
              
                /**/ SizedBox(height: 30),
                Center(
                  child: FilledButton.tonalIcon(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const RegisterationPage()));
                    },
                    icon: const Icon(IconlyLight.login),
                    label: const Text('Login',style: TextStyle(fontWeight: FontWeight.bold),),
                  
                  ),
                ),
                 Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don t have a an account ?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
    );
  }
}