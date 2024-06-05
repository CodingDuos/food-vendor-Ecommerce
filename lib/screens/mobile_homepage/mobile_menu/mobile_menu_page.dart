import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';

import 'package:food_ecommerce/services/responsive.dart';

class MobileMenuPageScreen extends StatelessWidget {
  const MobileMenuPageScreen({super.key});

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
          const MobileMenuPageScreenBody()
        ],
      ),
    );
  }
}

class MobileMenuPageScreenBody extends StatelessWidget {
  const MobileMenuPageScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.getResponsivePadding(context),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Our',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: AppColors.headingTextColor,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Categories',
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
            SizedBox(
              height: 150,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox(
                        width: 170,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.primaryColor,
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            height: 170,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'images/leaves.png',
                                  color: Colors.white,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset(
                                    'images/35.png',
                                    color: Colors.white,
                                  ),
                                ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('images/burger.png'),
                                      Text(
                                        'Burger',
                                        style: TextStyle(
                                            color: AppColors.whitecolor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    return SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300)),
                          height: 170,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/burger.png'),
                              Text(
                                'Burger',
                                style: TextStyle(
                                    color: AppColors.headingTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 40,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const DesktopMenuItem();
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopMenuItem extends StatelessWidget {
  const DesktopMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('images/mi-4.png'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Frutti Di MAri',
                  style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'Shirmp. Squid, Pineapple',
                  style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Price :£15.00',
                  style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class TabletMenuItem extends StatelessWidget {
  const TabletMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('images/mi-4.png'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Frutti Di MAri',
                  style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'Shirmp. Squid, Pineapple',
                  style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Price :£15.00',
                  style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
