import 'package:flutter/material.dart';


class CategoryEmptyScreen extends StatefulWidget {
  const CategoryEmptyScreen({super.key});

  @override
  State<CategoryEmptyScreen> createState() => _CategoryEmptyScreenState();
}

class _CategoryEmptyScreenState extends State<CategoryEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const SizedBox(height: 60),
          Center(child: Image.asset('assets/empty.png',scale: 1.7)),
          const Center(child: Text('No Category Garden Packages...!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
        

        ],
      );
    

  }
}