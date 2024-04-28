import 'package:flutter/material.dart';


class OrderEmptyScreen extends StatefulWidget {
  const OrderEmptyScreen({super.key});

  @override
  State<OrderEmptyScreen> createState() => _OrderEmptyScreenState();
}

class _OrderEmptyScreenState extends State<OrderEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const SizedBox(height: 80),
          Center(child: Image.asset('assets/order.png',scale: 1.7)),
          const Center(child: Text('No Orders are Available...!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
        
        ],
      );
    

  }
}