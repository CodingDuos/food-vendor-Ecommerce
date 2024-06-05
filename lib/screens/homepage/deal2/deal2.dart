import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/services/responsive.dart';

class DealOfferPage2 extends StatelessWidget {
  const DealOfferPage2({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    return Container(
      color: AppColors.primarycolorBackground,
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(
              top: 200,
              right: 0,
              child:
                  Image.asset('images/15.png', color: AppColors.primaryColor)),
          Positioned(top: 0, right: 100, child: Image.asset('images/30.png')),
          Positioned(top: 0, left: 0, child: Image.asset('images/30.png')),
          Positioned(top: 0, left: 0, child: Image.asset('images/18 (1).png')),
          Positioned(
              top: 450, right: 0, child: Image.asset('images/6 (1).png')),
          Positioned(top: 0, left: 0, child: Image.asset('images/6.png')),
          Positioned(
              bottom: 100, left: 200, child: Image.asset('images/6 (1).png')),
          const DealOfferPageBody2()
        ],
      ),
    );
  }
}

class DealOfferPageBody2 extends StatelessWidget {
  const DealOfferPageBody2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.getResponsivePadding(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 100),
        child: SizedBox(
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fresh Taste At A Great',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.whitecolor,
                      fontSize: 62,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Price , Only For',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.whitecolor,
                            fontSize: 62,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' Delicious',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.fOODColor,
                            fontSize: 62,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Food Lover',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.fOODColor,
                      fontSize: 62,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '£19.67',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.fOODColor,
                            fontSize: 62,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' £35.88',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.whitecolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        child: Container(
                          width: 400,
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
                      ),
                    ],
                  )
                ],
              )),
              Expanded(child: Image.asset('images/new.png')),
            ],
          ),
        ),
      ),
    );
  }
}
