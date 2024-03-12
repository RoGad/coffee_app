import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/category_model.dart';
import 'package:flutter_course/src/features/menu/view/widgets/coffee_card.dart';
import 'package:flutter_course/src/features/menu/data/styles.dart';

import 'package:flutter_course/src/features/menu/models/card_model.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.data}) : super(key: key);

  final CategoryModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            data.title,
            style: AppTextStyles.title,
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _buildCoffeeCard(data.card[index]),
            separatorBuilder: (context, _) => const SizedBox(width: 16),
            itemCount: data.card.length,
          ),
        ),
      ],
    );
  }

  Widget _buildCoffeeCard(CardModel card) {
    return CoffeeCard(data: card);
  }
}
