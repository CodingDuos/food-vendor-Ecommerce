import 'package:flutter/material.dart';

import 'package:food_ecommerce/constants/constants_colors.dart';

class MobilePopularDishesPage extends StatelessWidget {
  const MobilePopularDishesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobilePopularDishesPageBody();
  }
}

class MobilePopularDishesPageBody extends StatelessWidget {
  const MobilePopularDishesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Popular',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColors.headingTextColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' Dishes',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColors.primaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const FoodItemsGrid();
                });
          })
        ],
      ),
    );
  }
}

class FoodItemsGrid extends StatelessWidget {
  const FoodItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        height: 350,
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
          child: Column(
            children: [
              Expanded(
                  child: SizedBox(
                      width: double.infinity,
                      child: Image.asset('images/chicken.png',
                          fit: BoxFit.cover))),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, top: 5),
                    child: Row(
                      children: [
                        Text(
                          'Chicken Fry',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.headingTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      'It is a long established fact that a reader BBQ food Chicken.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: AppColors.headingTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14, top: 20, right: 14),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Price : £15.00',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.headingTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all()),
                              height: 45,
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_basket_outlined),
                                    SizedBox(width: 10),
                                    Text('Add To Cart',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
