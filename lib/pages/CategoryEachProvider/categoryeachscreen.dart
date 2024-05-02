import 'package:community_garden_coordinator/ExtraScreens/loadingscreen.dart';
import 'package:community_garden_coordinator/pages/CategoryEachProvider/alleachcategorywidget.dart';
import 'package:community_garden_coordinator/pages/CategoryEachProvider/categoryeachprovider.dart';
import 'package:community_garden_coordinator/pages/CategoryEachProvider/emptycategoryscreen.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';


class AllCategoryEachScreen extends StatefulWidget {
  static const routeName = 'all_categorypackage_screen';
    final String catepackage;

  const AllCategoryEachScreen({
    Key? key,required this.catepackage
  }) : super(key: key);

  @override
  State<AllCategoryEachScreen> createState() => _AllCategoryEachScreenState();
}

class _AllCategoryEachScreenState extends State<AllCategoryEachScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryEachProvider>(context, listen: false)
        .getAllEachCategorysData(context: context,categorypackage: widget.catepackage);
        
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final catepackage= Provider.of<CategoryEachProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor:Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Category Garden Packages',
              style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
            ),
         
          ],
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         catepackage.package.isNotEmpty?Text('Category Packages Near You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text(''),
            //  cateproduct.category.isEmpty?Text(''): TextFormField(
            //     decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),fillColor: Colors.white,filled: true,hintText: 'Search',suffixIcon: Icon(Icons.search)),
            //       onChanged: (value) {
            //       if (value != "") {
            //         String searchQuery = value.toLowerCase();
            //         print("hhhhhhhhh");
            //         cateproduct.getSearchData(value: searchQuery);
            //       }
            //     },
            //   ),
              SizedBox(height: size.height*0.02),
              catepackage.loadingSpinner
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
                           
                        : catepackage.package.isEmpty
                            ? const CategoryEmptyScreen()
                            : SizedBox(
                              height: size.height * 0.8,
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 0.9),
                                  scrollDirection: Axis.vertical,
                                  itemCount: catepackage.package.length,
                                  itemBuilder: (context, intex) {
                                    return AllEachCategoryWidget(
                                      packageid:  catepackage.package[intex].packageId,
                                     packagename: catepackage.package[intex].packageName,
                                     packageprice:  catepackage.package[intex].price,
                                      image:  catepackage.package[intex].photo,
                                    
                                    );
                                  },
                                ),
                              ),
            ],
          ),
        ),
      ),     
    );
  }
}
