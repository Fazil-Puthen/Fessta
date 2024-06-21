

import 'package:fesste/constants.dart';
import 'package:fesste/presentation/formscreen/bloc/formbloc_bloc.dart';
import 'package:fesste/presentation/formscreen/formscreen.dart';
import 'package:fesste/presentation/homescreen/bloc/home_bloc.dart';
import 'package:fesste/presentation/homescreen/widgets/restaurantcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> names=['fazil','sheba','abji','aboo','basil','fahmer'];
  final searchcontrol=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    // final screenheight= MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(

        //Add button
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo_outlined),
          focusColor: Colors.red,
          onPressed:() {
           Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Formscreen()));
        },),

        //Appbar
        appBar: PreferredSize(
          preferredSize:const Size.fromHeight(100),
           child: Container(
            decoration:  BoxDecoration(
              color: Colors.red[700],
              // border: Border.all(width: 8,color: Colors.red),
              borderRadius:const  BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              // color: Colors.red,
            ),
            child:const Center(
              child: Image(image: AssetImage('asset/Tomato (1).png')),
            )
           )),

           //Body
           body:Center(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
             
                //Search bar
                SizedBox(
                  width: 350,
                  height: 50,
                  child: SearchBar(
                    leading: const Icon(Icons.search),
                    controller:searchcontrol ,
                    hintText: 'Search Restaurant',
                    onChanged: (value) {
                      // List<String> filter=names.where((element) {
                      //   final itemlower=element.toLowerCase();
                      //   final queylower=searchcontrol.text.toLowerCase();
                      //   return itemlower.contains(queylower);
                      // }).toList();
                      context.read<HomeBloc>().add(Searchevent(value:value));
                      
                    },
                  ),),

                //Search Suggestion
                box,
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                  if(state is Searchsuccess){
                    final filter=state.filtered;
                    return Container(
                      width: 300,
                      height: 100,
                      child: ListView.separated(itemBuilder:(context, index) {
                        return Text(filter[index]);
                      }, separatorBuilder:(context, index) {
                        return box;
                      }, itemCount: filter.length),
                    );
                  }
                  else if(state is NoSuggestion){
                    return SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('No sugggestion',style: acmeerror,),),);
                  }
                  return SizedBox();
                  },
                ),
                 SizedBox(height: 20,),
             
                //Zomato list
                Expanded(child: 
                Container(
                  width: screenwidth*0.9,
                  child: BlocBuilder<FormblocBloc, FormblocState>(
                    builder: (context, state) {
                      if(state is Restaurantlist){
                        final list=state.reslist;
                      return ListView.separated(itemBuilder:(context, index) {
                                      return RestCard(restaturant: list[index],);
                                    },
                                     separatorBuilder:(context, index) {
                                       return const SizedBox(height: 10,);
                                     }, 
                                     itemCount: list.length);
                                     }
                      else{
                        return const Center(child:Text('No restaurant Added'),);
                      }               
                    },
                  ),
                ))
              ],
             ),
           )
      ),
    );
  }
}