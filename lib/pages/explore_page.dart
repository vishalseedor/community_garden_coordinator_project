import 'package:animate_do/animate_do.dart';
import 'package:community_garden_coordinator/ExtraScreens/loadingscreen.dart';
import 'package:community_garden_coordinator/provider/ViewPackageProvider/allgardenWidget.dart';
import 'package:community_garden_coordinator/provider/ViewPackageProvider/viewpackageprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<GardenProvider>(context, listen: false)
        .getAllGardenData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final garden = Provider.of<GardenProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(99),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: "Search here...",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        onChanged: (value) {
                          if (value != "") {
                            String searchQuery = value.toLowerCase();
                            print("hhhhhhhhh");
                            garden.getSearchData(value: searchQuery);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: IconButton.filled(
                        onPressed: () {},
                        icon: const Icon(IconlyLight.filter),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: SizedBox(
                  height: 170,
                  child: Card(
                    color: Colors.green.shade50,
                    elevation: 0.1,
                    shadowColor: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Community Garden",
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: Colors.green.shade700, fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const Text("Get free support from our customer service"),
                                FilledButton(
                                  onPressed: () async {
                                    final Uri url = Uri(
                                      scheme: 'tel',
                                      path: "887 012 0688",
                                    );
                                    if (await canLaunch(url.toString())) {
                                      await launch(url.toString());
                                    } else {
                                      print('cannot launch this url');
                                    }
                                  },
                                  child: const Text(
                                    "Call now",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/contact_us.png',
                            width: 140,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Garden Packages",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: garden.loadingSpinner
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LoadingScreen(title: 'Loading'),
                          CircularProgressIndicator(
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    : garden.gardens.isEmpty
                        ? Center(
                            child: const Text(
                            'No Garden Packages...',
                            style: TextStyle(color: Colors.green),
                          ))
                        : garden.searchProducts.isEmpty && searchController.text.isNotEmpty
                            ? Center(
                                child: Text(
                                  'No Gardens Available',
                                  style: TextStyle(color: Colors.green),
                                ),
                              )
                            : searchController.text.isNotEmpty && garden.searchProducts.isNotEmpty
                                ? SizedBox(
                                    height: size.height * 0.6,
                                    child: GridView.builder(
                                      itemCount: garden.searchProducts.length,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.8,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return SingleChildScrollView(
                                          child: AllGardenWidgett(
                                            packageid: garden.searchProducts[index].packageId,
                                            packagename: garden.searchProducts[index].packageName,
                                            price: garden.searchProducts[index].price,
                                            area: garden.searchProducts[index].area,
                                            unittype: garden.searchProducts[index].unitType,
                                            image: garden.searchProducts[index].photo,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    height: size.height * 0.6,
                                    child: GridView.builder(
                                      itemCount: garden.gardens.length,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.72,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return SingleChildScrollView(
                                          child: AllGardenWidgett(
                                            packageid: garden.gardens[index].packageId,
                                            packagename: garden.gardens[index].packageName,
                                            price: garden.gardens[index].price,
                                            area: garden.gardens[index].area,
                                            unittype: garden.gardens[index].unitType,
                                            image: garden.gardens[index].photo,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
