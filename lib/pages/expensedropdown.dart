
import 'package:community_garden_coordinator/pages/drop_downmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ExpenseDropDown extends StatelessWidget {
  final List<StateDetails> list;
  final String? value;
  final String hint;
  final Function(Object?) onChanged;
  const ExpenseDropDown(
      {super.key,
      required this.hint,
      required this.list,
      required this.onChanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      color:Colors.green,
      child: DropdownButtonFormField(
        decoration:const InputDecoration(
          
            contentPadding: EdgeInsets.only(left: 20, bottom: 20),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none),
        isExpanded: true,
        alignment: Alignment.center,
        hint: Center(
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            style:const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        items: list.map((e) {
          return DropdownMenuItem(
            value: '',
            child: Center(
              child: Text(
                e.state.toString(),
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
