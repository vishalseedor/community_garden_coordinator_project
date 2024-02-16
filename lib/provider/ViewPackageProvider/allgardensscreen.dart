
import 'package:community_garden_coordinator/ExtraScreens/errorscreen.dart';
import 'package:community_garden_coordinator/ExtraScreens/loadingscreen.dart';
import 'package:community_garden_coordinator/provider/ViewPackageProvider/viewpackageprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AllGardenScreen extends StatefulWidget {
  static const routeName = 'all_garden_screen';

  const AllGardenScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllGardenScreen> createState() => _AllGardenScreenState();
}

class _AllGardenScreenState extends State<AllGardenScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<GardenProvider>(context, listen: false)
        .getAllGardenData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final garden = Provider.of<GardenProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Products',
                style: TextStyle(fontSize: 14),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        body: garden.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : garden.isError
                ? ErrorScreen(title: garden.isError.toString())
                : garden.gardens.isEmpty
                    ? const Text(
                        'No Products ',
                      )
                    : garden.gardens.isEmpty
                        ? const Center(child: Text("No Products"))
                        : ListView.builder(
                            itemCount: garden.gardens.length,
                            itemBuilder: (ctx, index) {
                              print(garden.gardens.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
