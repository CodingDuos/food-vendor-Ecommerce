import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/screens/header/header_view.dart';

class MyCartMain extends StatelessWidget {
  const MyCartMain({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height / 2 - 100;
    double screenWidth = screenSize.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: AppColors.primarycolorBackground,
      child: Stack(
        children: [
          Positioned(
            right: screenWidth * 0.21,
            child: Container(
              width: 450,
              height: screenHeight,
              color: AppColors.secondaryColor,
            ),
          ),
          Positioned(child: Image.asset('images/18.png')),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('images/burgervendor.png')),
          Positioned(top: -5, right: -5, child: Image.asset('images/3.png')),
          Positioned(
              bottom: 570,
              left: 600,
              child: Image.asset(
                'images/34.png',
                color: Colors.white,
              )),
          SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'My Cart',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.whitecolor,
                      fontSize: 62,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Home / My Cart',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.whitecolor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          const Positioned(child: HeaderViewPageBody())
        ],
      ),
    );
  }
}
