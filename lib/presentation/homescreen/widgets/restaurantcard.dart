import 'package:fesste/constants.dart';
import 'package:fesste/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class RestCard extends StatelessWidget {
  final RestaurantModel restaturant;
  const RestCard({super.key,required this.restaturant});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      shadowColor: Colors.green,


      //Outer container
      child: Container(
        height: 280,
        decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(30) ,
        ) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

          //Image container
          Container(
            decoration:  BoxDecoration(
              image: DecorationImage(image: FileImage(restaturant.imagepath),
              fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
            ),
            height: 200,
          ),

          //Name and type field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(restaturant.name,style:acmebig,),
              SizedBox(height: 3,),
              Text('cuisine type',style: acmesmall,)],
            ),
            
            //Rating field
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]
              ),
              width: 50,
              height: 30,
              child:Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ Text(restaturant.rating.toString()),
                SizedBox(width: 3,),
              const Icon(Icons.star_border_purple500,size: 15,color: Colors.amber,)]),),
            )],),
          )
        ],),
      ),
    );
  }
}