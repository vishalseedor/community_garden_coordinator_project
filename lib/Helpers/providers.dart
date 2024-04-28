




import 'package:community_garden_coordinator/pages/CategoryEachProvider/categoryeachprovider.dart';
import 'package:community_garden_coordinator/pages/Feedback/feedbackprovider.dart';
import 'package:community_garden_coordinator/pages/OrderProvider/orderprovider.dart';
import 'package:community_garden_coordinator/pages/ProfileScreen/userprovider.dart';
import 'package:community_garden_coordinator/provider/CategoryProvider/categoryprovider.dart';
import 'package:community_garden_coordinator/provider/ViewPackageProvider/viewpackageprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
    ChangeNotifierProvider(create: (context)=>GardenProvider()),
    ChangeNotifierProvider(create: (context)=>CategoryProvider()),
    ChangeNotifierProvider(create: (context)=>CategoryEachProvider()),
    ChangeNotifierProvider(create: (context)=>OrderProvider()),
    ChangeNotifierProvider(create: (context)=>UserProvider()),
    ChangeNotifierProvider(create: (context)=>FeedbackProvider())
      
 
];
