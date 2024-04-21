import 'dart:ui';
import 'package:community_garden_coordinator/ExtraScreens/loadingscreen.dart';
import 'package:community_garden_coordinator/provider/CategoryProvider/allcategorywidget.dart';
import 'package:community_garden_coordinator/provider/CategoryProvider/categoryprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ServicesPage extends StatefulWidget {
    static const routeName = 'all_category_screen';
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
    @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  final size=MediaQuery.of(context).size;
  final category = Provider.of<CategoryProvider>(context);
    return Scaffold(
      body:  category.loadingSpinner
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
                  :category.categories.isEmpty
                      ? const Center(
                          child: Text(
                          'No Garden Packages...',
                          style: TextStyle(color:Colors.green),
                        ))
                      : SizedBox(
                         // height: size.height * 0.6,
                          child: GridView.builder(
        itemCount: category.categories.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemBuilder: (context, index) {
          return AllCategoryWidget(
            categoryid: category.categories[index].categoryId,
            categoryname: category.categories[index].category,
            categoryimage: category.categories[index].categoryimage,
            );
      // body: GridView.builder(
      //   itemCount: services.length,
      //   padding: const EdgeInsets.all(16),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 0.85,
      //     crossAxisSpacing: 14,
      //     mainAxisSpacing: 14,
      //   ),
      //   itemBuilder: (context, index) {
      //     return Container(
      //       alignment: Alignment.bottomCenter,
      //       padding: const EdgeInsets.all(10),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //         image: DecorationImage(
      //           image: AssetImage(services[index].image),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //       child: ClipRRect(
      //         borderRadius: BorderRadius.circular(5),
      //         child: BackdropFilter(
      //           filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      //           child: Container(
      //             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      //             decoration: BoxDecoration(
      //               color: Colors.white.withOpacity(0.2),
      //               borderRadius: const BorderRadius.all(Radius.circular(5)),
      //             ),
      //             child: Text(
      //               services[index].name,
      //               style: const TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
  })));
  }
}
