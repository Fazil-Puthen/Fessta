part of 'formbloc_bloc.dart';

@immutable
sealed class FormblocState {}

final class FormblocInitial extends FormblocState {}

class ImageSuccess extends FormblocState{
  final File imagepath;
  ImageSuccess({required this.imagepath});
}

class Restaurantlist extends FormblocState{
  final List<RestaurantModel> reslist;

  Restaurantlist({required this.reslist});
}
