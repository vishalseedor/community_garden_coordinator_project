import 'package:community_garden_coordinator/pages/product_details_page.dart';
import 'package:flutter/material.dart';



class AllEachCategoryWidget extends StatefulWidget {
  final String packageid;
  final String packagename;
  final String packageprice;
  final String image;
  

  const AllEachCategoryWidget(
      {super.key,
     required this.packageid,
     required this.packagename,
     required this.packageprice,
     required this.image
      });

  @override
  State<AllEachCategoryWidget > createState() => _AllEachCategoryWidgetState();
}

class _AllEachCategoryWidgetState extends State<AllEachCategoryWidget > {
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
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "₹ ${widget.packageprice}",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.green,fontWeight: FontWeight.bold)),
                           
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: 30,
                      //   height: 30,
                      //   child: IconButton.filled(
                      //     padding: EdgeInsets.zero,
                      //     onPressed: () {},
                      //     iconSize: 18,
                      //     icon: const Icon(Icons.add,color: Colors.white,),
                      //   ),
                      // )
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
