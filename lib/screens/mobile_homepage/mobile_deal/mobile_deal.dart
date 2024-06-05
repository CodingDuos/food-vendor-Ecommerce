import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';

class MobileDealOfferPage extends StatelessWidget {
  const MobileDealOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    return Container(
        color: AppColors.primarycolorBackground,
        width: screenWidth,
        child: const MobileDealOfferPageBody());
  }
}

class MobileDealOfferPageBody extends StatelessWidget {
  const MobileDealOfferPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/tomato (2).png'),
        Text(
          'Spicy Chicken',
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
                text: 'Pizza',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: AppColors.whitecolor,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' FOOD',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: AppColors.fOODColor,
                  fontSize: 42,
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
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '520',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Days',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Icon(
                  Icons.more_vert,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '15',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Hours',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Icon(
                  Icons.more_vert,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '46',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Minutes',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 16,
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
          mainAxisAlignment: MainAxisAlignment.center,
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
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
