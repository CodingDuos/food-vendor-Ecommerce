import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';

class MobileAllFoodsDishesPages extends StatelessWidget {
  const MobileAllFoodsDishesPages({super.key});

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
          const MobileAllFoodsDishesPagesBody()
        ],
      ),
    );
  }
}

class MobileAllFoodsDishesPagesBody extends StatelessWidget {
  const MobileAllFoodsDishesPagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'All',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.headingTextColor,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' Dishes',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.primaryColor,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return FoodItemsGrid(index: index);
                });
          })
        ],
      ),
    );
  }
}

class FoodItemsGrid extends StatelessWidget {
  const FoodItemsGrid({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        height: 170,
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: SizedBox(
                      height: 170,
                      width: double.infinity,
                      child: Image.asset(
                          'images/${index.isEven ? 'chicken' : 'sandwich'}.png',
                          fit: BoxFit.cover))),
              Expanded(
                  flex: 7,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.shopping_basket_outlined),
                                        SizedBox(width: 5),
                                        Text('Add To Cart',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 14,
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
