import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';

class MobileOffersPage extends StatelessWidget {
  const MobileOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    return SizedBox(
      width: screenWidth,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SuperComboBurgerBlack(),
            SizedBox(height: 10),
            SuperComboBurger(),
            SizedBox(height: 10),
            SuperComboBurgerGreen(),
            SizedBox(height: 10),
            SuperComboBurgerGreen(),
            SizedBox(height: 10),
            SuperComboBurger(),
            SizedBox(height: 10),
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
      height: 200,
      color: const Color(0xffFF9933),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(top: 10, child: Image.asset('images/transparent2.png')),
          Positioned(
              bottom: 2,
              right: 0,
              child: SizedBox(
                  height: 150,
                  width: 200,
                  child: Image.asset('images/23.png', fit: BoxFit.fill))),
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
      height: 200,
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
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
              ),
            ),
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
      height: 200,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                  height: 150,
                  width: 200,
                  child: Image.asset(
                    'images/24.png',
                    fit: BoxFit.fill,
                  ))),
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
                    fontSize: 30,
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
