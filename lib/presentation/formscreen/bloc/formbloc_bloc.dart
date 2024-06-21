import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fesste/models/restaurant_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'formbloc_event.dart';
part 'formbloc_state.dart';

class FormblocBloc extends Bloc<FormblocEvent, FormblocState> {
  FormblocBloc() : super(FormblocInitial()) {
    on<FormblocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Imageselction>(imagepicker);
    on<AddRestaurant>(addrestaurant);
    on<FormError>(formerror);
  }

  List<RestaurantModel> restaurantlist=[];

  FutureOr<void> imagepicker(Imageselction event, Emitter<FormblocState> emit)async {
    final picker=ImagePicker();

    final pickedfile=await picker.pickImage(source: ImageSource.gallery);

    if(pickedfile!=null){
      File path=File(pickedfile.path);
      emit(ImageSuccess(imagepath: path));
    }
  }

    FutureOr<void> addrestaurant(AddRestaurant event, Emitter<FormblocState> emit) {
   
   restaurantlist.add(event.restmodel);
   emit(Restaurantlist(reslist: restaurantlist));

  }

  FutureOr<void> formerror(FormError event, Emitter<FormblocState> emit) {
    emit(ErrorState());
  }
}
