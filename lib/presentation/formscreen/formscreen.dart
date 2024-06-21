import 'dart:io';

import 'package:fesste/constants.dart';
import 'package:fesste/models/restaurant_model.dart';
import 'package:fesste/presentation/formscreen/bloc/formbloc_bloc.dart';
import 'package:fesste/presentation/formscreen/widgets/dropdown.dart';
import 'package:fesste/presentation/homescreen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Formscreen extends StatelessWidget {
  Formscreen({super.key});
  
  late File imagepostion;
  final textcontroller=TextEditingController();
  double rate=0;
 
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        //App Bar
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'fesste',
                    style: TextStyle(fontSize: 20),
                  ),
                ))),
      
        //Body
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
        
                //image container
                InkWell(
                  onTap: () {
                    context.read<FormblocBloc>().add(Imageselction());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    width: 200,
                    height: 200,
                    child: BlocBuilder<FormblocBloc, FormblocState>(
                      builder: (context, state) {
                        if(state is ImageSuccess){
                          imagepostion=state.imagepath as File;
                          return Image.file(state.imagepath, fit: BoxFit.cover,);
                        }
                        return const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Photo',
                                style: TextStyle(color: Colors.red),
                              ),
                              Icon(Icons.image_outlined),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
        
                //Name field
                SizedBox(
                  width: screenwidth * 0.8,
                  height: 50,
                  child: TextFormField(
                    controller: textcontroller,
                    decoration:
                        InputDecoration(hintText: 'Restaurant Name',hintStyle: acmesmall),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
        
                //dropdwonbox
                SizedBox(
                    width: screenwidth * 0.8,
                    height: 60,
                    child: CusineSelcetion()),
                const SizedBox(
                  height: 15,
                ),
        
                //animated star
                Text('Your Rating',style: acmesmall,),
                AnimatedRatingStars(
                  onChanged: (value) {
                    rate=value;
                  },
                  minRating: 0.0,
                  maxRating: 5.0,
                  customFilledIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  customEmptyIcon: Icons.star_border_outlined,
                ),
                const SizedBox(
                  height: 40,
                ),
        
                //Add Button
                InkWell(
                  onTap:() {
                    if(rate!=null && imagepostion!=null){
                      final restmodel=RestaurantModel(
                        name: textcontroller.text.trim(),
                        imagepath: imagepostion,
                        rating: rate,
                      );
                      context.read<FormblocBloc>().add(AddRestaurant(restmodel: restmodel));
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: Center(
                      child: Text('Add Restaurant',style: acmesmall,),
                    ),
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
