import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/services/responsive.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Container(
      color: AppColors.whitecolor,
      width: screenWidth,
      height: screenHeight - 300,
      child: Stack(
        children: [
          Positioned(bottom: 0, right: 0, child: Image.asset('images/17.png')),
          Positioned(top: 450, right: 0, child: Image.asset('images/4.png')),
          Positioned(top: 0, left: 0, child: Image.asset('images/7.png')),
          Positioned(top: 450, left: 0, child: Image.asset('images/13.png')),
          Positioned(
              bottom: 100, left: 200, child: Image.asset('images/layer2.png')),
          const DealOfferPageBody()
        ],
      ),
    );
  }
}

class DealOfferPageBody extends StatelessWidget {
  const DealOfferPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.getResponsivePadding(context),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 200, top: 100),
        child: SizedBox(
          child: Row(
            children: [
              Expanded(
                  child: Container(
                color: const Color(0xffCC3333),
                child: Stack(
                  children: [
                    Positioned(
                        top: 10, child: Image.asset('images/transparent2.png')),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.headingTextColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text(
                                    'Free Delivery',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Free Delivery Over £100',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.whitecolor,
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Order £100 or more and get free delivery anywhere.',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.whitecolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Text(
                                    'Order Now',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                        Expanded(child: Image.asset('images/pizzabike.png'))
                      ],
                    )
                  ],
                ),
              )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Container(
                color: const Color(0xffFF9933),
                child: Stack(
                  children: [
                    Positioned(
                        top: 10, child: Image.asset('images/transparent2.png')),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.headingTextColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text(
                                    '60% Off',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Grocery Items',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.whitecolor,
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Save up to 60% off on your First Order',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.whitecolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Text(
                                    'Order Now',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                        Expanded(child: Image.asset('images/grocery.png'))
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
