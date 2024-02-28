
import 'package:community_garden_coordinator/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Image.asset('assets/H.png'),
              ),
              const Spacer(),
              Text('Welcome to Community Garden ',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "Welcome to our community garden, where seeds of connection, growth, and sustainability are planted, nurtured, and blossomed under the dedicated coordination of our passionate garden enthusiasts",
                  textAlign: TextAlign.center
                ),
              ),
              /**/
              FilledButton.tonalIcon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const LoginPage()));
                },
                icon: const Icon(IconlyLight.login),
                label: const Text("Get Started"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
