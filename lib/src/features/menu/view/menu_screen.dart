import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/styles.dart';
import 'package:flutter_course/src/features/menu/view/widgets/category.dart';
import 'package:flutter_course/src/theme/app_colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_course/src/features/menu/data/data_example.dart';

import 'dart:developer' as developer;
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() {
    return _MenuScreenState();
  }
}

class _MenuScreenState extends State<MenuScreen> {
  final itemListener = ItemPositionsListener.create();
  bool playingAnimation = false;
  int current = 0;
  final itemController = ItemScrollController();
  final barItemController = ItemScrollController();
  bool onBottom = false;

  @override
  void initState() {
    super.initState();
    _setupItemListener();
  }

  void _setupItemListener() {
    itemListener.itemPositions.addListener(() {
      _handleScrollPositionChange();
    });
  }

  void _handleScrollPositionChange() {
    final fullVisible = itemListener.itemPositions.value.where((item) {
      final isTopVisible = item.itemLeadingEdge >= 0;
      final isBottomVisible = item.itemTrailingEdge < 1.02;
      return isTopVisible && isBottomVisible;
    }).map((item) => item.index).toList();

    if (fullVisible.length == 2) {
      if ((fullVisible[1] == DataExample.category_strings_db_example.length - 1) &&
          !playingAnimation) {
        if (fullVisible[1] != current) {
          onBottom = true;
          _updateCurrentAndScrollToItem(fullVisible[1]);
        }
      } else {
        onBottom = false;
      }
    } else {
      onBottom = false;
    }

    if (((fullVisible[0] != current) && !playingAnimation) && !onBottom) {
      _updateCurrentAndScrollToItem(fullVisible[0]);
    }
  }

  void _updateCurrentAndScrollToItem(int index) {
    setState(() {
      current = index;
    });
    _scrollToItem(index);
    _barScrollToItem(index);
  }

  void _scrollToItem(int index) {
    playingAnimation = true;
    itemController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 200),
    );
    // await Future.delayed(const Duration(milliseconds: 200));
  }

  void _barScrollToItem(int index) {
    barItemController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 120),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: Colors.transparent,
        title: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SizedBox(
            height: 60,
            child: ScrollablePositionedList.separated(
              scrollDirection: Axis.horizontal,
              itemScrollController: barItemController,
              separatorBuilder: (context, _) => SizedBox(width: 16),
              itemCount: DataExample.category_strings_db_example.length,
              itemBuilder: (context, index) => Container(
                height: 32,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () => _updateCurrentAndScrollToItem(index),
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    alignment: Alignment.center,
                    backgroundColor: index == current ? AppColors.mainColor : AppColors.white,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  ),
                  child: Text(
                    DataExample.category_strings_db_example[index],
                    style: index == current ? AppTextStyles.chipActive : AppTextStyles.chip,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ScrollablePositionedList.separated(
          separatorBuilder: (context, _) => SizedBox(height: 16),
          itemCount: DataExample.category_db_example.length,
          itemScrollController: itemController,
          itemPositionsListener: itemListener,
          itemBuilder: (context, index) => Category(
            data: DataExample.category_db_example[index],
            key: ValueKey(DataExample.category_db_example[index].title),
          ),
        ),
      ),
    );
  }
}
