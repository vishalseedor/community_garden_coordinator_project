
import 'package:community_garden_coordinator/pages/Feedback/feedbackscreen.dart';
import 'package:community_garden_coordinator/pages/Feedback/helpscreen.dart';
import 'package:community_garden_coordinator/pages/Feedback/privacyandpolicyscreen.dart';
import 'package:community_garden_coordinator/pages/ProfileScreen/editprofilescreen.dart';
import 'package:community_garden_coordinator/pages/ProfileScreen/userprovider.dart';
import 'package:community_garden_coordinator/pages/login_page.dart';
import 'package:community_garden_coordinator/pages/orders_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    @override
  void initState() {
    Provider.of<UserProvider>(context,listen: false).getUserData(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.png')
              ),
            ),
          ),
          // Center(
          //   child: Text(
          //     "Vishal",
          //     style: Theme.of(context).textTheme.titleMedium,
          //   ),
          // ),
           Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].firstname;
                  print(userAddress+'vvvvvvvvv');
                }
                return Center(
                  child: Text(
                    '$userAddress',
                    style:Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }),
                 Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].email;
                  print(userAddress+'vvvvvvvvv');
                }
                return Center(
                  child: Text(
                    '$userAddress',
                    style:Theme.of(context).textTheme.bodySmall,
                  ),
                );
              }),
              
          // Center(
          //   child: Text(
          //     "vishal123@gmail.com",
          //     style: Theme.of(context).textTheme.bodySmall,
          //   ),
          // ),
          const SizedBox(height: 25),

          //  ListTile(
          //   title: const Text("DashBoard",),
          //   leading: const Icon(IconlyBold.bookmark,color: Color.fromARGB(255, 22, 109, 24),),
          //   onTap: () {
             
          //   },
          // ),
          
          // ListTile(
          //   title: const Text("My orders"),
          //   leading: const Icon(IconlyBold.bag,color: Color.fromARGB(255, 22, 109, 24)),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const OrdersPage(),
          //         ));
          //   },
          // ),
            ListTile(
            title: const Text("Edit Profile",),
            leading: const Icon(IconlyBold.profile,color: Color.fromARGB(255, 22, 109, 24)),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>const ProfileEditScreen()));
            },
          ),
            ListTile(
            title: const Text("Feedback",),
            leading: const Icon(IconlyBold.document,color: Color.fromARGB(255, 22, 109, 24)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SupportScreen()));
            },
          ),
            ListTile(
            title: const Text("Help"),
            leading: const Icon(IconlyBold.shieldDone,color: Color.fromARGB(255, 22, 109, 24)),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> const HelpScreen()));
            },
          ),
            ListTile(
            title: const Text("Privacy & Policy"),
            leading: const Icon(IconlyBold.activity,color: Color.fromARGB(255, 22, 109, 24)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const PrivacyandPolicyScreen()));
            },
          ),
          ListTile(
            title: const Text("About us"),
            leading: const Icon(IconlyBold.infoSquare,color: Color.fromARGB(255, 22, 109, 24)),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(IconlyBold.logout,color: Color.fromARGB(255, 22, 109, 24)),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text(
                        'Logout',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content:
                          const Text('Are you sure want to exit this app?'),
                      actions: <Widget>[
                        TextButton(
                         
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(
                              fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                              
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                               fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                  },
                );
            },
          ),
        ],
      ),
    );
  }
}
