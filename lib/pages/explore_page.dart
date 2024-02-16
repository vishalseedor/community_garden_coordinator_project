
import 'package:community_garden_coordinator/ExtraScreens/loadingscreen.dart';
import 'package:community_garden_coordinator/provider/ViewPackageProvider/allgardenWidget.dart';
import 'package:community_garden_coordinator/provider/ViewPackageProvider/viewpackageprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  const  ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
    @override
  void initState() {
    Provider.of<GardenProvider>(context, listen: false)
        .getAllGardenData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
     final garden = Provider.of<GardenProvider>(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here...",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      prefixIcon: const Icon(IconlyLight.search),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton.filled(onPressed: () {}, icon: const Icon(IconlyLight.filter)),
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
                                    color: Colors.green.shade700,
                                  ),
                            ),
                            const Text("Get free support from our customer service"),
                            FilledButton(
                              onPressed: () {},
                              child: const Text("Call now"),
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
                "Featured Gardens",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See all"),
              ),
            ],
          ),
          garden.loadingSpinner
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingScreen(title: 'Loading'),
                        CircularProgressIndicator(
                          color:Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                     
                      ],
                    )
                  : garden.gardens.isEmpty
                      ? const Center(
                          child: Text(
                          'No Garden Packages...',
                          style: TextStyle(color:Colors.green),
                        ))
                      : SizedBox(
                          height: size.height * 0.6,
                          child: GridView.builder(
            itemCount: garden.gardens.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return AllGardenWidgett(
                packageid: garden.gardens[index].packageId,
                packagename: garden.gardens[index].packageName,
                price: garden.gardens[index].price,
                area: garden.gardens[index].area,
                unittype: garden.gardens[index].unitType,
                image: garden.gardens[index].photo);
            },
          )
                        ),  
          // GridView.builder(
          //   itemCount: products.length,
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     childAspectRatio: 0.8,
          //     crossAxisSpacing: 16,
          //     mainAxisSpacing: 16,
          //   ),
          //   itemBuilder: (context, index) {
          //     return ProductCard(product: products[index]);
          //   },
          // )
        ],
      ),
    );
  }
}
