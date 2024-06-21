import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:fesste/models/restaurant_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Searchevent>(searchhandler);
    on<FetchNames>(fetchname);
    
      }
  List<String> usernames=[];

  FutureOr<void> searchhandler(Searchevent event, Emitter<HomeState> emit) {
    final filter=event.value;

    if(filter.isNotEmpty){
      List<String> filtered=usernames.where((element) {
                        final itemlower=element.toLowerCase();
                        final queylower=filter.toLowerCase();
                        return itemlower.contains(queylower);
                      }).toList();
                      print('this is filterd $filtered');
      if(filtered.isEmpty){
        emit(NoSuggestion());
      }
      else{
      emit(Searchsuccess(filtered: filtered));}
    }
    else if(filter.isEmpty){
      emit(Empty());
    }
  }

  FutureOr<void> fetchname(FetchNames event, Emitter<HomeState> emit) async{

    print('fetvhing the http ooooooooooooooooooiiiiiiiiiiiiiiiiiii');
    const url='https://jsonplaceholder.typicode.com/users';

    final resulturl=Uri.parse(url);
    try{
    final result=await http.get(resulturl);
    if(result.statusCode==200){
    List<dynamic> decoded=json.decode(result.body);
    usernames = decoded.map((json) => json['name'].toString()).toList();
    print('this is the usernames ${usernames}');}
    else{
      print('something went wrong');
    }
    }
    catch(e){
      print('this is the error ${e.toString()}');
    }

  }

}
