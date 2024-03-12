import 'package:flutter_course/src/features/menu/models/card_model.dart';
import 'package:flutter_course/src/features/menu/models/category_model.dart';


class DataExample{
  static List<CardModel> cards_dark_coffee_db_example =
  [
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Темный кофе',
      price: '100 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Крпекий кофе',
      price: '110 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Вкусный кофе',
      price: '120 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Так себе кофе',
      price: '130 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Норм кофе',
      price: '140 руб',
    ),
  ];
  static List<CardModel> cards_milk_coffee_db_example =
  [
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Мендальный кофе',
      price: '123 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Коровий кофе',
      price: '234 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Кокосовый кофе',
      price: '1313 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Не кокосовый кофе',
      price: '124 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Какой-то кофе',
      price: '100 руб',
    ),
  ];
  static List<CardModel> cards_tea_db_example =
  [
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Крепкий чай',
      price: '160 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Зеленый чай',
      price: '420 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Индийский чай',
      price: '138 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Китайский чай',
      price: '144 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Русский чай',
      price: '155 руб',
    ),
  ];
  static List<CardModel> cards_milk_tea_db_example =
  [
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Молочный чай',
      price: '100 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Мендальный чай',
      price: '120 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Кокосовый чай',
      price: '130 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Коровий чай',
      price: '140 руб',
    ),
    const CardModel(
      ico: 'lib/src/assets/images/example_image.png',
      name: 'Какой-то еще чай',
      price: '150 руб',
    ),
  ];

  static List<String> category_strings_db_example = [
    'Черный кофе',
    'Кофе с молоком',
    'Чай',
    'Чай с молоком',
  ];

  static List<CategoryModel> category_db_example =
  [
    CategoryModel(
      title: 'Черный кофе',
      card: cards_dark_coffee_db_example,
    ),
    CategoryModel(
      title: 'Кофе с молоком',
      card: cards_milk_coffee_db_example,
    ),
    CategoryModel(
      title: 'Чай',
      card: cards_tea_db_example,
    ),
    CategoryModel(
      title: 'Чай с молоком',
      card: cards_milk_tea_db_example,
    ),
  ];


}