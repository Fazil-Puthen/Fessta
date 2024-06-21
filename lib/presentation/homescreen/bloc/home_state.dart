part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class Searchsuccess extends HomeState{
  final List<String> filtered;

  Searchsuccess({required this.filtered});
}


class NoSuggestion extends HomeState{}

class Loading extends HomeState{}

class Empty extends HomeState{}
