import 'package:flutter_sample/ui/package/dio/model/rating.dart';

class Wine {
  String winery;
  String wine;
  Rating rating;
  String location;
  String image;
  int id;

  Wine({
    required this.winery,
    required this.wine,
    required this.rating,
    required this.location,
    required this.image,
    required this.id,
  });
}
