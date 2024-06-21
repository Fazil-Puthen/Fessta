import 'package:fesste/constants.dart';
import 'package:flutter/material.dart';

class CusineSelcetion extends StatefulWidget {
  CusineSelcetion({super.key});

  @override
  State<CusineSelcetion> createState() => _CusineSelcetionState();
}

class _CusineSelcetionState extends State<CusineSelcetion> {
   final List<String> cuisine=['Indian','Italian','Chinese'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
    decoration: InputDecoration(
      labelText: 'Select Cusine',
      labelStyle: acmesmall
    ),
    items:cuisine.map((String element) {
            return DropdownMenuItem<String>(
              value: element,
              child: Text(element,style: acmesmall,),
            );
          }).toList(),
    onChanged:(e)=>print(e));
  }
}