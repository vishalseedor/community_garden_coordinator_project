
import 'package:community_garden_coordinator/provider/ViewPackageProvider/viewpackageprovider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';


class GardenDetailsPage extends StatefulWidget {
static const routeName = 'garden_details_screen';
  final String id;
  const GardenDetailsPage({super.key,
  required this.id});



  @override
  State<GardenDetailsPage> createState() => _GardenDetailsPageState();
}

class _GardenDetailsPageState extends State<GardenDetailsPage> {
  

  // late TapGestureRecognizer readMoreGestureRecognizer;
  // bool showMore = false;

  // @override
  // void initState() {
  //   super.initState();
  //   readMoreGestureRecognizer = TapGestureRecognizer()
  //     ..onTap = () {
  //       setState(() {
  //         showMore = !showMore;
  //       });
  //     };
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   readMoreGestureRecognizer.dispose();
  // }

  @override
  Widget build(BuildContext context) {
      final garden = Provider.of<GardenProvider>(context,listen: false);
      final gardenData =
        Provider.of<GardenProvider>(context).gardens.firstWhere((element) => element.packageId == widget.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.bookmark),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(gardenData.photo),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            gardenData.packageName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available in stock",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "\$${gardenData.price}",
                        style: Theme.of(context).textTheme.titleLarge),
                    TextSpan(
                        text: "/${gardenData.unitType}",
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.yellow.shade800,
              ),
              Text(
                "${gardenData.daysRequired} (192)",
              ),
              const Spacer(),
              SizedBox(
                height: 30,
                width: 30,
                child: IconButton.filledTonal(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  iconSize: 18,
                  icon: const Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "2 ${gardenData.unitType}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: IconButton.filledTonal(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  iconSize: 18,
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text("Description",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),

          Text(gardenData.description),
          // RichText(
          //   text: TextSpan(
          //     style: Theme.of(context).textTheme.bodyMedium,
          //     children: [
          //       TextSpan(
          //         text: showMore
          //             ? gardenData.description
          //             : '${gardenData.description.substring(0, gardenData.description.length - 100)}...',
          //       ),
          //       TextSpan(
          //         recognizer: readMoreGestureRecognizer,
          //         text: showMore ? " Read less" : " Read more",
          //         style: TextStyle(
          //           color: Theme.of(context).colorScheme.primary,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20),
          Text(
            "Coordinator Details",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('Coordinator Name : ${gardenData.name}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
             Text('Coordinator Email : ${gardenData.email}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
             Text('Coordinator Phone : ${gardenData.phone}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
             Text('Coordinator Address : ${gardenData.address}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
             Text('About Coordinator : ${gardenData.aboutCoordinator}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
          // SizedBox(
          //   height: 90,
          //   child: ListView.separated(
          //     physics: const BouncingScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         height: 90,
          //         width: 80,
          //         margin: const EdgeInsets.only(bottom: 16),
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: NetworkImage(gardenData.photo),
          //             fit: BoxFit.cover,
          //           ),
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //       );
          //     },
          //     separatorBuilder: (__, _) => const SizedBox(
          //       width: 10,
          //     ),
          //     itemCount: garden.gardens.length,
          //   ),
          // ),
          const SizedBox(height: 20),
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(IconlyLight.bag2),
              label: const Text("Add to cart"))
        ],
      ),
    );
  }
}
