import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';

class ManageQuantityCommonWidget extends StatelessWidget {
  const ManageQuantityCommonWidget(
      {super.key,
      required this.qunatity,
      required this.onadd,
      required this.onremove});
  final String qunatity;
  final Function() onadd;
  final Function() onremove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onremove,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xffFFF8ed),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.remove, color: Colors.amber),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          qunatity,
          style: TextStyle(
              color: AppColors.headingTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: onadd,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryColor)),
            child: Center(
              child: Icon(Icons.add, color: AppColors.whitecolor),
            ),
          ),
        ),
      ],
    );
  }
}
