import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/screens/header/mobile_header.dart';

class MobileHomePageMain extends StatelessWidget {
  const MobileHomePageMain({super.key});

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
              image: AssetImage('images/hero.png'), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
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
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Cooking Best',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.whitecolor,
                                  fontSize: 42,
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
                                  fontSize: 42,
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
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {},
                          child: Container(
                            width: 170,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.primaryColor),
                            child: const Center(
                              child: Text(
                                'Order Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(child: MobileHeaderViewPageBody())
        ],
      ),
    );
  }
}
