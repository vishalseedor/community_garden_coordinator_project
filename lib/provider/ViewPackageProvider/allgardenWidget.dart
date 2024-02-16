

import 'package:community_garden_coordinator/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


class AllGardenWidgett extends StatefulWidget {
  final String packageid;
  final String packagename;
  final String price;
  final String area;
  final String unittype;
  final String image;
  

  const AllGardenWidgett(
      {super.key,
    required this.packageid,
    required this.packagename,
    required this.price,
    required this.area,
    required this.unittype,
     required this.image
      });

  @override
  State<AllGardenWidgett > createState() => _AllGardenWidgettState();
}

class _AllGardenWidgettState extends State<AllGardenWidgett > {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);

     return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(GardenDetailsPage.routeName,arguments:widget.packageid);
         // Navigator.of(context).pushNamed(GardenDetailsScreen.routeName,arguments:widget.packageid);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        elevation: 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(                                               
              height: 130,
              alignment: Alignment.topRight,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),   
              ),
              child: SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filledTonal(
                  padding: EdgeInsets.zero,
                  onPressed: () {}, 
                  iconSize: 18,
                  icon: const Icon(IconlyLight.bookmark),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      widget.packagename,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "\$${widget.price}",
                                style: Theme.of(context).textTheme.bodyLarge),
                            TextSpan(
                                text: "/${widget.unittype}",
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: IconButton.filled(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          iconSize: 18,
                          icon: const Icon(Icons.add),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
