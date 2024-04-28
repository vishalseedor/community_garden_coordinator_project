  import 'package:community_garden_coordinator/pages/OrderProvider/ordersscreen.dart';
import 'package:flutter/material.dart';




class GlobalSnackBar {
  customSnackbar({
    required BuildContext context,
  }) {
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 70,
            child: Row(
              children: [
                 Image.asset('assets/farmer.png',height: 35,width: 35,),
                const SizedBox(width: 20),
                const Text(
                  'Book Garden Package SuccessFully',
                  style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),
                ),
             
              ],
            ),
          
          ),
          // InkWell(
          //     onTap: () {
          //       ScaffoldMessenger.of(context).hideCurrentSnackBar();
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) =>  const MyOrdersScreen()));
          //     },
            

          //     child: Container(
          //         height: 40,
          //         width: 100,
          //         decoration: BoxDecoration(
          //             borderRadius: const BorderRadius.all(
          //               Radius.circular(6),
          //             ),
          //             color: const Color.fromARGB(255, 27, 85, 29)),
          //         child:  Center(
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               Image.asset('assets/farmer.png',height: 20,width: 20,),
          //               // Icon(
          //               //   Icons.shopping_bag_rounded,
          //               //   color: Colors.white,
          //               // ),
          //               Text('VIEW ORDERS',
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 10,
          //                       fontWeight: FontWeight.bold)),
          //             ],
          //           ),
          //         )))
        ],
      ),
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      // action: SnackBarAction(
      //   textColor: CustomColor.whitecolor,
      //   label: 'View cart',
      //   onPressed: () {},
      // ),
    );
  }

  generalSnackbar({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 40,
        child: Center(
          child: Text(text),
        ),
      ),

      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor:  const Color.fromARGB(255, 27, 85, 29),
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      // action: SnackBarAction(
      //   textColor: CustomColor.whitecolor,
      //   label: 'View cart',
      //   onPressed: () {},
      // ),
    ));
  }

  successsnackbar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 40,
        child: Center(
          child: Text(text),
        ),
      ),

      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor:  const Color.fromARGB(255, 27, 85, 29),
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'View cart',
        onPressed: () {},
      ),
    ));
  }
}
 