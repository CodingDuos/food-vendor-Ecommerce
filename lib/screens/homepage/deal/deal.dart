import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/services/responsive.dart';

class DealOfferPage extends StatelessWidget {
  const DealOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Container(
      color: AppColors.primarycolorBackground,
      width: screenWidth,
      height: screenHeight + 200,
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
              bottom: 0, right: 0, child: Image.asset('images/tomato.png')),
          Positioned(
              top: 450, right: 0, child: Image.asset('images/6 (1).png')),
          Positioned(top: 0, left: 0, child: Image.asset('images/6.png')),
          Positioned(
              top: 450, left: 0, child: Image.asset('images/tomato (1).png')),
          Positioned(top: 200, left: 0, child: Image.asset('images/25.png')),
          Positioned(
              bottom: 100, left: 200, child: Image.asset('images/6 (1).png')),
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
      child: SizedBox(
        child: Row(
          children: [
            MediaQuery.of(context).size.width < 1200
                ? Container()
                : Expanded(child: Image.asset('images/tomato (2).png')),
            MediaQuery.of(context).size.width < 1200
                ? Container(width: 200)
                : Container(),
            Expanded(
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Spicy Chicken',
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
                          text: 'Pizza',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.whitecolor,
                            fontSize: 62,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' FOOD',
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Feel Hunger! Order Your Favourite Food.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.whitecolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '520',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.whitecolor,
                              fontSize: 62,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Days',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.whitecolor,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.more_vert,
                            color: AppColors.primaryColor,
                            size: 60,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '15',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.whitecolor,
                              fontSize: 62,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Hours',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.whitecolor,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.more_vert,
                            color: AppColors.primaryColor,
                            size: 60,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '46',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.whitecolor,
                              fontSize: 62,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Minutes',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.whitecolor,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.more_vert,
                            color: AppColors.primaryColor,
                            size: 60,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '30',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.whitecolor,
                              fontSize: 62,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Seconds',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.whitecolor,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        padding: const EdgeInsets.all(0),
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
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
