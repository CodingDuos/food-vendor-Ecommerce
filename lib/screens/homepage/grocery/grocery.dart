import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/services/responsive.dart';

class GroceryItemsList extends StatelessWidget {
  const GroceryItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    return Container(
      color: AppColors.whitecolor,
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(top: 200, right: 0, child: Image.asset('images/15.png')),
          Positioned(top: 450, right: 0, child: Image.asset('images/16.png')),
          Positioned(top: 0, left: 0, child: Image.asset('images/6.png')),
          Positioned(top: 450, left: 0, child: Image.asset('images/7.png')),
          Positioned(top: 200, left: 0, child: Image.asset('images/13.png')),
          const GroceryItemsListBody()
        ],
      ),
    );
  }
}

class GroceryItemsListBody extends StatelessWidget {
  const GroceryItemsListBody({super.key});

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
                        text: 'Daily Best',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColors.headingTextColor,
                          fontSize: 62,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' Sell',
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
                    'Featured',
                    'Popular',
                    'New Added',
                  ]
                      .map((e) => e == 'Featured'
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
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.5,
                      crossAxisCount: calculateCrossAxisCount(
                          context, constraints.maxWidth)),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Card(
                          elevation: 0.3,
                          color: AppColors.primarycolorBackground,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Bring',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: AppColors.whitecolor,
                                          fontSize: 43,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Nature',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: AppColors.fOODColor,
                                          fontSize: 43,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Into Your',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: AppColors.whitecolor,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Home.',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: AppColors.whitecolor,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(child: Image.asset('images/cof.png'))
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return const FoodItemsGrid();
                  });
            })
          ],
        ),
      ),
    );
  }
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade400)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.headingTextColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: const Center(
                        child: Text(
                          'HOT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('images/natural.png'),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        'Blue Dimonds Almonds Lightly Slated Vegetables',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 5),
                      child: Row(
                        children: [
                          Row(
                            children: [0, 1, 2, 3, 4]
                                .map((e) => Icon(
                                      Icons.star,
                                      size: 18,
                                      color:
                                          e < 3 ? Colors.yellow : Colors.grey,
                                    ))
                                .toList(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '(4.9)',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 5),
                      child: Row(
                        children: [
                          Text(
                            '£19.99 ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.headingTextColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text('\$8.99',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 5),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.headingTextColor),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text('Sold: 17/150',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          )),
                    ),
                    MaterialButton(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      onPressed: () {},
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.primaryColor),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          )),
                    )
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

int calculateCrossAxisCount(BuildContext context, double screenWidth) {
  double itemWidth = 300.0;
  int crossAxisCount = (screenWidth / itemWidth).floor();
  return crossAxisCount < 1 ? 1 : crossAxisCount;
}
