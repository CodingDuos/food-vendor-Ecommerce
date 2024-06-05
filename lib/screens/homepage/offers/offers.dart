import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/services/responsive.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Padding(
      padding: Responsive.getResponsivePadding(context),
      child: Container(
        color: AppColors.indexBackgroundColor,
        height: (screenHeight / 2) + 150,
        width: screenWidth,
        child: Row(
          children: [
            const Expanded(
                flex: 8,
                child: Row(
                  children: [
                    Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            Expanded(child: SuperComboBurgerBlack()),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(child: SuperComboBurger()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(child: SuperComboBurgerGreen()),
                                ],
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Expanded(child: SuperComboBurgerGreen()),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(child: SuperComboBurger()),
                          ],
                        ))
                  ],
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  color: const Color(0xffCC3333),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 10,
                          child: Image.asset('images/transparent2.png')),
                      Positioned(
                          bottom: 20,
                          right: -80,
                          child: Image.asset('images/22 (1).png')),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Super Combo Burger',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: AppColors.whitecolor,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.only(left: 20),
                            onPressed: () {},
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.whitecolor),
                              child: Center(
                                child: Text(
                                  'Order Now',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class SuperComboBurger extends StatelessWidget {
  const SuperComboBurger({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFF9933),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(top: 10, child: Image.asset('images/transparent2.png')),
          Positioned(bottom: 2, right: 0, child: Image.asset('images/23.png')),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Super Combo Burger',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Order Now',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SuperComboBurgerGreen extends StatelessWidget {
  const SuperComboBurgerGreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff336600),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(top: 0, left: 0, child: Image.asset('images/26 (2).png')),
          Positioned(
              bottom: 20,
              top: 20,
              right: 0,
              child: Image.asset('images/16.png')),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Super Delicious Pizza',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Order Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SuperComboBurgerBlack extends StatelessWidget {
  const SuperComboBurgerBlack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primarycolorBackground,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(bottom: 0, right: 0, child: Image.asset('images/24.png')),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Buzzed Burger',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Order Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding: const EdgeInsets.only(left: 20),
                onPressed: () {},
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor),
                  child: const Center(
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
