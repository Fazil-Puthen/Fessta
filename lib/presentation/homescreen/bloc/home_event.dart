part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class Searchevent extends HomeEvent{
 final String value;

  Searchevent({required this.value});
}

class FetchNames extends HomeEvent{}


