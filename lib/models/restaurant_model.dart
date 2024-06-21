import 'dart:io';

class RestaurantModel{
  final File imagepath;
  final String name;
  final double rating;
  // final String cuisine;

  RestaurantModel({
    // required this.cuisine,
    required this.name,
    required this.imagepath,
    required this.rating
  });
}