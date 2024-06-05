import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';

class AddToCartWidget extends StatefulWidget {
  const AddToCartWidget({super.key, required this.callback});
  final Function() callback;

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  bool ishover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (val) {
        ishover = val;
        setState(() {});
      },
      onTap: widget.callback,
      child: Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ishover ? AppColors.primaryColor : null,
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Center(
            child: Icon(
          Icons.shopping_basket_outlined,
          color: ishover ? AppColors.whitecolor : AppColors.primaryColor,
        )),
      ),
    );
  }
}
