import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';

class TextPaymentwidget extends StatelessWidget {
  const TextPaymentwidget(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
          Text(
            value,
            style: TextStyle(
                color: AppColors.headingTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
