import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/services/responsive.dart';

class AllFoodsDishesPages extends StatelessWidget {
  const AllFoodsDishesPages({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    return Container(
      color: AppColors.indexBackgroundColor,
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(top: 200, right: 0, child: Image.asset('images/15.png')),
          Positioned(top: 450, right: 0, child: Image.asset('images/16.png')),
          Positioned(top: 0, left: 0, child: Image.asset('images/6.png')),
          Positioned(top: 450, left: 0, child: Image.asset('images/7.png')),
          Positioned(top: 200, left: 0, child: Image.asset('images/13.png')),
          const AllFoodsDishesPagesBody()
        ],
      ),
    );
  }
}

class AllFoodsDishesPagesBody extends StatelessWidget {
  const AllFoodsDishesPagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.getResponsivePadding(context),
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'All',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColors.headingTextColor,
                          fontSize: 62,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' Dishes',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColors.primaryColor,
                          fontSize: 62,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    'All Items',
                    'Pizza',
                    'Burgers',
                    'Chickens',
                    'Drinks'
                  ]
                      .map((e) => e == 'All Items'
                          ? Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.primaryColor),
                              child: Center(
                                child: Text(
                                  e,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 50,
                              width: 150,
                              child: Center(
                                child: Text(e.toString()),
                              ),
                            ))
                      .toList(),
                ),
              ],
            ),
            LayoutBuilder(builder: (context, constraints) {
              return GridView.builder(
                  shrinkWrap: true,
                  itemCount: 16,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: calculateCrossAxisCount(
                          context, constraints.maxWidth)),
                  itemBuilder: (context, index) {
                    return const FoodItemsGrid();
                  });
            })
          ],
        ),
      ),
    );
  }
}

int calculateCrossAxisCount(BuildContext context, double screenWidth) {
  double itemWidth = 350.0;
  int crossAxisCount = (screenWidth / itemWidth).floor();
  return crossAxisCount < 1 ? 1 : crossAxisCount;
}

class FoodItemsGrid extends StatelessWidget {
  const FoodItemsGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: const Color(0xffFFF7DD),
                      child: Center(
                        child: Image.asset('images/mi-4.png'),
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Row(
                        children: [
                          Text(
                            'Chicken Fry',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.headingTextColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 20),
                      child: Row(
                        children: [
                          Text(
                            'Price : £15.00',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.headingTextColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          Positioned(
              top: 30,
              left: 30,
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: AppColors.headingTextColor,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    'HOT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Positioned(
              top: 30,
              right: 10,
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.shopping_basket_outlined,
                      color: AppColors.primaryColor,
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                    )),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
