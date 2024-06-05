import 'package:flutter/material.dart';

import 'package:food_ecommerce/constants/constants_colors.dart';

class MobileApplicationRefrencePage extends StatelessWidget {
  const MobileApplicationRefrencePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/rest.png'), fit: BoxFit.fill)),
        width: screenWidth,
        height: 470,
        child: const Stack(
          children: [MobileApplicationRefrencePageBody()],
        ),
      ),
    );
  }
}

class MobileApplicationRefrencePageBody extends StatelessWidget {
  const MobileApplicationRefrencePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Find out Better Restaurant Food Experience',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'We have done it carefully and simply. Combined with the ingredients makes for beautiful landings.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    {
                      'name': 'Play Store',
                      'color': Colors.white,
                      'image': 'images/playstore.png',
                      'textcolor': Colors.black
                    },
                    {
                      'name': 'App Store',
                      'textcolor': Colors.white,
                      'color': Colors.black,
                      'image': 'images/apple.png'
                    },
                  ]
                      .map((e) => Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, top: 20),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: e['color'] as Color,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(e['image'] as String),
                                    const SizedBox(width: 20),
                                    Text(
                                      e['name'] as String,
                                      style: TextStyle(
                                        color: e['textcolor'] as Color,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
