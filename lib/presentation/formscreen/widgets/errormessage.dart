import 'package:fesste/constants.dart';
import 'package:fesste/presentation/formscreen/bloc/formbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormblocBloc, FormblocState>(
      builder: (context, state) {
        if(state is ErrorState){
        return Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline,size: 30,color: Colors.amber,),
            Text('All fields are Required',style: acmeerror,),
          ],
        );}
        else{
          return box;
        }
      }
    );
  }
}