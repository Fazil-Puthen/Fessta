import 'dart:io';
import 'package:fesste/constants.dart';
import 'package:fesste/models/restaurant_model.dart';
import 'package:fesste/presentation/formscreen/bloc/formbloc_bloc.dart';
import 'package:fesste/presentation/formscreen/widgets/errormessage.dart';
import 'package:flutter/material.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Formscreen extends StatelessWidget {
  Formscreen({super.key});

  late  File imagepostion;
  late  String cuisne;
  final textcontroller = TextEditingController();
  double rate=0;
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        //App Bar
        appBar: PreferredSize(
          preferredSize:const Size.fromHeight(100),
           child: Container(
            decoration:  BoxDecoration(
              color: Colors.red[400],
              // border: Border.all(width: 8,color: Colors.red),
              borderRadius:const  BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              // color: Colors.red,
            ),
            child:const Center(
              child: Image(image: AssetImage('asset/tomatoes.png',)),
            )
           )),

        //Body
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
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
                          if (state is ImageSuccess) {
                            imagepostion = state.imagepath;
                            return Image.file(
                              state.imagepath,
                              fit: BoxFit.cover,
                            );
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
                       validator: (value) {
                        if(textcontroller.text.isEmpty){
                          return "Required field";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Restaurant Name', hintStyle: acmesmall),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
              
                  //dropdwonbox
                  SizedBox(
                      width: screenwidth * 0.8,
                      height: 60,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              labelText: 'Select Cusine', labelStyle: acmesmall),
                          items: cuisine.map((String element) {
                            return DropdownMenuItem<String>(
                              value: element,
                              child: Text(
                                element,
                                style: acmesmall,
                              ),
                            );
                          }).toList(),
                          onChanged: (e) => cuisne=e!)),
                  const SizedBox(
                    height: 15,
                  ),
              
                  //animated star
                  Text(
                    'Your Rating',
                    style: acmesmall,
                  ),
                  AnimatedRatingStars(
                    onChanged: (value) {
                      rate = value;
                    },
                    minRating: 0.0,
                    maxRating: 5.0,
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border_outlined,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const ErrorMessage(),
                  box,
              
                  //Add Button
                  InkWell(
                    onTap: () {
                      if(formkey.currentState!.validate()){
                      if (rate == 0.0 || imagepostion==null || cuisne.isEmpty) {
                        context.read<FormblocBloc>().add(FormError());
                      }
                      else{
                        final restmodel = RestaurantModel(
                          name: textcontroller.text.trim(),
                          imagepath: imagepostion,
                          rating: rate,
                          cuisine: cuisne
                        );
                        context
                            .read<FormblocBloc>()
                            .add(AddRestaurant(restmodel: restmodel));
                        Navigator.pop(context);
                      }
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
                        child: Text(
                          'Add Restaurant',
                          style: acmesmall,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


