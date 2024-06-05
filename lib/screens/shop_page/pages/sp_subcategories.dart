import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class MenuSubCategories extends StatelessWidget {
  const MenuSubCategories(
      {super.key,
      required this.isSelected,
      required this.name,
      required this.uUID});
  final bool isSelected;
  final String name;
  final String uUID;

  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return isSelected == true
        ? SizedBox(
            width: 170,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.headingTextColor,
                    border: Border.all(color: Colors.grey.shade300)),
                height: 170,
                child: Stack(
                  children: [
                    Image.asset(
                      'images/leaves.png',
                      color: Colors.white,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'images/35.png',
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/burger.png'),
                          Text(
                            name,
                            style: TextStyle(
                                color: AppColors.whitecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              mainController.setSelectedSubCategory(name, uUID);
            },
            child: SizedBox(
              width: 180,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300)),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/burger.png'),
                      Text(
                        name,
                        style: TextStyle(
                            color: AppColors.headingTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
