
import 'package:animate_do/animate_do.dart';
import 'package:community_garden_coordinator/pages/OrderProvider/gardensnackbar.dart';
import 'package:community_garden_coordinator/pages/OrderProvider/globalsnackbar.dart';
import 'package:community_garden_coordinator/pages/OrderProvider/orderprovider.dart';
import 'package:community_garden_coordinator/pages/ProfileScreen/userprovider.dart';


import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class OrderDetailsScreen extends StatefulWidget {
static const routeName = 'order_details_screen';
  final String id;
  const OrderDetailsScreen({super.key,
  required this.id});



  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  

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
    GlobalSnackBar _snackBar =GlobalSnackBar();
  ProductSnackBar _productSnackBar=ProductSnackBar();
      
       final user=Provider.of<UserProvider>(context,listen: false);
        final order=Provider.of<OrderProvider>(context,listen: false);
      final orderData =
        Provider.of<OrderProvider>(context).orders.firstWhere((element) => element.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Package Order Details",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(IconlyLight.buy),
        //   ),
        // ],
      ),
      body: FadeInUp(
        duration: const Duration(milliseconds: 1500),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              height: 250,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(orderData.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text(
              orderData.packagename,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold,fontSize: 19),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "₹ ${orderData.price}",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold,fontSize: 18)),
                      // TextSpan(
                      //     text: "  /  ${orderData.orderDate}",
                      //     style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold,color: Colors.green)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // Icon(
                //   Icons.star,
                //   size: 16,
                //   color: Colors.yellow.shade800,
                // ),
                Text(
                  "Order Date : ${orderData.orderDate}",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15),
                ),
                
                const Spacer(),
                
                // SizedBox(
                //   height: 30,
                //   width: 30,
                //   child: IconButton.filledTonal(
                //     padding: EdgeInsets.zero,
                //     onPressed: () {},
                //     iconSize: 18,
                //     icon: const Icon(Icons.remove),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 12),
                //   child: Text(
                //     "2 ${gardenData.unitType}",
                //     style: Theme.of(context).textTheme.titleMedium!.copyWith(
                //           fontWeight: FontWeight.bold,
                //         ),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                //   width: 30,
                //   child: IconButton.filledTonal(
                //     padding: EdgeInsets.zero,
                //     onPressed: () {},
                //     iconSize: 18,
                //     icon: const Icon(Icons.add),
                //   ),
                // ),
              ],
            ),
             const SizedBox(height: 10),
              Text(
                  "Order Status: ${orderData.status}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),
                ),
            const SizedBox(height: 20),
            Text("Description",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
        
            Text(orderData.description),
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
          
          
            const SizedBox(height: 20),
          
          ],
        ),
      ),
    );
  }
}
