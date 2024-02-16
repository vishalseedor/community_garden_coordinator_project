import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';



class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List categoryItemlist = [];

  Future getAllCategory() async {
    var baseUrl = "http://campus.sicsglobal.co.in/Project/communitygarden/api/view_all_states.php";

    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemlist = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return  DropdownButton(
              hint: Text('chooseNumber'),
              items: categoryItemlist.map((item) {
                return DropdownMenuItem(
                  value: item[''].toString(),
                  child: Text(item['state'].toString()),
                );
              }).toList(),
              onChanged: (newVal) {
                setState(() {
                  dropdownvalue = newVal;
                });
              },
              value: dropdownvalue,
            );
  }
}