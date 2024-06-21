part of 'formbloc_bloc.dart';

@immutable
sealed class FormblocEvent {}

class Imageselction extends FormblocEvent{}

class AddRestaurant extends FormblocEvent{
final RestaurantModel restmodel;

AddRestaurant({required this.restmodel});
}

class FormError extends FormblocEvent{}
