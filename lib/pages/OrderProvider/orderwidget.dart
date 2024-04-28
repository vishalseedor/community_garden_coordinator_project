import 'package:community_garden_coordinator/pages/OrderProvider/orderdetailsscreen.dart';
import 'package:flutter/material.dart';



class AllOrdersWidget extends StatefulWidget {
  final String orderid;
  final String packageid;
  final String packagename;
  final String price;
  final String description;
  final String orderstatus;
  final String orderDate;
  final String image;




  const AllOrdersWidget({super.key,required this.orderid,required this.packageid,
  required this.packagename,
  required this.description,
  required this.price,
  required this.orderstatus,
  required this.orderDate,
required this.image
});

  @override
  State<AllOrdersWidget> createState() => _AllOrdersWidgetState();
}

class _AllOrdersWidgetState extends State<AllOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  SizedBox(
        height: 140,
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(OrderDetailsScreen.routeName,arguments:widget.orderid);
          },
          child: Card(
            color: Colors.grey[100],
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 90,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:NetworkImage(widget.image),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.packagename,
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 2),
                        Text(
                          widget.description,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\₹ : ${widget.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                           Container(
                            height: 35,
                            width: 100,
                            
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green[100]),
                            child: Center(child: Text(widget.orderstatus,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                           )
                            // SizedBox(
                            //   height: 30,
                            //   child: ToggleButtons(
                            //     borderRadius: BorderRadius.circular(99),
                            //     constraints: const BoxConstraints(
                            //       minHeight: 30,
                            //       minWidth: 30,
                            //     ),
                            //     selectedColor:
                            //         Theme.of(context).colorScheme.primary,
                            //     isSelected: const [
                            //       true,
                            //       false,
                            //       true,
                            //     ],
                            //     children: [
                            //       const Icon(
                            //         Icons.remove,
                            //         size: 20,
                            //       ),
                            //     //  Text("${Random().nextInt(5) + 1}"),
                            //       const Icon(
                            //         Icons.add,
                            //         size: 20,
                            //       ),
                            //     ],
                            //     onPressed: (int index) {
                            //       if (index == 0) {
                            //         // decrease quantity
                            //       } else if (index == 2) {
                            //         // increase quantity
                            //       }
                            //     },
                            //   ),
                            // ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}