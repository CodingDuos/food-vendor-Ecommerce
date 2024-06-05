import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';

import 'package:food_ecommerce/screens/header/mobile_header.dart';
import 'package:provider/provider.dart';

class MobileSHopPageMain extends StatelessWidget {
  const MobileSHopPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height / 2;
    double screenWidth = screenSize.width;
    final controller = Provider.of<FoodEcommerceProvider>(context);

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: AppColors.primarycolorBackground,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/hello.png'), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.currentLocation != null
                        ? controller.currentLocation!.bussinessName.toString()
                        : '',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.whitecolor,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.house, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        controller.currentLocation != null
                            ? controller.currentLocation!.address.toString()
                            : '',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColors.whitecolor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.call, color: Colors.white),
                      const SizedBox(width: 5),
                      Text(
                        controller.currentLocation != null
                            ? controller.currentLocation!.telephoneNumber
                                .toString()
                            : '',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColors.whitecolor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '  -  ',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColors.whitecolor,
                          fontSize: 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.timelapse_outlined, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        '20/02/2024 8:00AM to 10:00 Pm',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColors.whitecolor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
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
