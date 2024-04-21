
import 'package:badges/badges.dart' as badges;
import 'package:community_garden_coordinator/pages/Feedback/feedbackscreen.dart';
import 'package:community_garden_coordinator/pages/cart_page.dart';
import 'package:community_garden_coordinator/pages/explore_page.dart';
import 'package:community_garden_coordinator/pages/login_page.dart';
import 'package:community_garden_coordinator/pages/profile_page.dart';
import 'package:community_garden_coordinator/pages/services_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [const ExplorePage(), const ServicesPage(), const CartPage(), const ProfilePage()];
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: Text('Vishal V S'), accountEmail: Text('vishal123@gmail.com'),currentAccountPicture: CircleAvatar(radius:60,backgroundImage: NetworkImage('https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3386&q=80'),)),
             ListTile(
              leading:  Icon(IconlyBold.home,color: Colors.green,),
              title: const Text('Dashboard',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
              onTap: () {
               
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExplorePage()));
              },
            ),
             ListTile(
              leading: Icon(Icons.pets,color: Colors.green,),
              title: Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
              onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>const ServicesPage()));
              },
                         ), 
           
             InkWell(
              onTap: () {
                //Navigator.push(context,MaterialPageRoute(builder:(context)=>const EventScreen()));
              },
               child: ListTile(
                leading: Icon(IconlyBold.paper,color: Colors.green,),
                title: Text('Pet Events',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                           ),
             ),
              InkWell(
              onTap: () {
               // Navigator.push(context,MaterialPageRoute(builder:(context)=>const MyOrdersScreen()));
              },
               child: ListTile(
                leading: Icon(IconlyBold.shieldDone,color: Colors.green,),
                title: Text('My Adoptions',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                           ),
             ),
             ListTile(
              leading: Icon(IconlyBold.message,color: Colors.green,),
              title: Text('Feedback',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
              onTap: () {
                     Navigator.push(context,MaterialPageRoute(builder:(context)=>const SupportScreen()));
              },
                         ),
            ListTile(
              leading:  Icon(IconlyBold.profile,color: Colors.green,),
              title: const Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>const ProfilePage()));
              },
            ),
            ListTile(
              leading:  Icon(IconlyBold.logout,color: Colors.green,),
              title: const Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Logout',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content:
                          const Text('Are you sure want to exit this app?'),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                               fontSize: 14,
                                color: Colors.white,
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
      ),
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton.filledTonal(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Vishal👋🏾",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text("Enjoy our services", style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                position: badges.BadgePosition.topEnd(top: -15, end: -12),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.green,
                ),
                child: const Icon(IconlyBroken.notification),
              ),
            ),
          ),
        ],
      ),
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: "Home",
            activeIcon: Icon(IconlyBold.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.category),
            label: "Category",
            activeIcon: Icon(IconlyBold.category),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            label: "Cart",
            activeIcon: Icon(IconlyBold.buy),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            label: "Profile",
            activeIcon: Icon(IconlyBold.profile),
          ),
        ],
      ),
    );
  }
}
