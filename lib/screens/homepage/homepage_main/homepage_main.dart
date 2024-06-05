import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/screens/header/header_view.dart';

import 'package:food_ecommerce/services/responsive.dart';

class HomePageMain extends StatelessWidget {
  const HomePageMain({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/hero.png'), fit: BoxFit.fill)),
      child: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: Responsive.getResponsivePadding(context),
              child: Row(
                children: [
                  MediaQuery.of(context).size.width < 1000
                      ? Container(width: 100)
                      : Container(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Homestyle Italian',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.whitecolor,
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Cooking Best Enjoyed',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.whitecolor,
                                  fontSize: 72,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'with Family.',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.whitecolor,
                                  fontSize: 72,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(child: Image.asset('images/1.png')),
                            SizedBox(
                              width: 200,
                              child: ListTile(
                                subtitle: Text(
                                  '123-456-789',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: AppColors.fOODColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                title: Text(
                                  'Delivery Order Num.',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: AppColors.whitecolor,
                                    // fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.primaryColor),
                                child: const Center(
                                  child: Text(
                                    'Try It Now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
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
