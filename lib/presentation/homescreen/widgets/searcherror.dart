import 'package:fesste/constants.dart';
import 'package:flutter/material.dart';

class Searcherror extends StatelessWidget {
  final String message;
  const Searcherror({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: 300,
      height: 100,
      child: Center(child: Text(message,style: acmeerror,),),);
  }
}