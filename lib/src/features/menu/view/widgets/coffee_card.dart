import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/card_model.dart';
import 'package:flutter_course/src/theme/app_colors.dart';
import 'package:flutter_course/src/features/menu/data/styles.dart';

class CoffeeCard extends StatefulWidget {

  const CoffeeCard({super.key, required this.data});
  final CardModel data;

  @override
  _CoffeeCardState createState() {
    return _CoffeeCardState();
  }
}

class _CoffeeCardState extends State<CoffeeCard> {

  int _counter = 0;

  void _incrementCounter() {
    if(_counter < 10)
      setState(() {
        _counter++;
      });
  }
  void _decrementCounter() {
    if(_counter > 0)
      setState(() {
        _counter--;
      });
  }

  static ButtonStyle button_style = ElevatedButton.styleFrom(
    elevation: 10,
    alignment: Alignment.center,
    backgroundColor: AppColors.mainColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.zero,
  );
  static ButtonStyle unactive_button_style = ElevatedButton.styleFrom(
    elevation: 10,
    alignment: Alignment.center,
    backgroundColor: AppColors.unactiveMainColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.zero,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical:  16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(widget.data.ico),
            height: 100,
            errorBuilder:
                (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Image(
                  image: AssetImage('lib/src/assets/images/outdate_image.png'),
                  height: 100
              );
            },
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.data.name,
              style: AppTextStyles.subtitle,
            ),
          ),
          SizedBox(
            height: 24,
            width: 116,
            child: _counter == 0? TextButton(
                onPressed: _incrementCounter,
                style: button_style,
                child: Text(
                  widget.data.price,
                  style: AppTextStyles.price,
                )
            )
                :
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 24,
                  child: TextButton(
                    onPressed: _decrementCounter,
                    style: button_style,
                    child: const Text(
                      '-',
                      style: AppTextStyles.priceChange,
                    ),
                  ),
                ),
                Container(
                    width: 52,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$_counter',
                      style: AppTextStyles.price,
                    )
                ),
                SizedBox(
                  width: 24,
                  child: TextButton(
                    onPressed: _incrementCounter,
                    style: _counter == 10? unactive_button_style : button_style,
                    child: const Text(
                      '+',
                      style: AppTextStyles.priceChange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
