import 'package:flutter_course/src/features/menu/models/card_model.dart';

class CategoryModel{
  const CategoryModel({
    required this.title,
    required this.card
  });

  final String title;
  final List<CardModel> card;
}