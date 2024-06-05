import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/services/responsive.dart';

import 'package:provider/provider.dart';

import '../../providers/dashboard_provider.dart';

class MobileFooterPageView extends StatelessWidget {
  const MobileFooterPageView({super.key, required this.selectedTabs});
  final String selectedTabs;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final controller = Provider.of<FoodEcommerceProvider>(context);
    return Container(
      width: screenSize.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/footer.png'), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Responsive.mobile(context)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  InformationWidget(
                    text: controller.currentLocation != null
                        ? controller.currentLocation!.address.toString()
                        : '',
                    heading: 'Address',
                    buttonText: 'View Google Map',
                  ),
                  const SizedBox(height: 20),
                  const InformationWidget(
                    text:
                        'Dogfood och Sliders foodtruck. Under Om oss kan ni läsa',
                    heading: 'Book A Table',
                    buttonText: 'Make A Call',
                  ),
                  const SizedBox(height: 20),
                  const InformationWidget(
                    text: 'Monday-Friday: 8am - 4pm - Saturday: 9am - 5pm',
                    heading: 'Opening Hours',
                    buttonText: 'Make A Call',
                  ),
                  const SizedBox(height: 20),
                  const NewsLetterWidget(),
                  const Divider(),
                  const SizedBox(height: 20),
                  const Text(
                    'Copyright 2024, QuomodoSoft. All Rights Reserved.',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                ],
              )
            : Padding(
                padding: Responsive.getResponsivePadding(context),
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InformationWidget(
                            text: controller.currentLocation != null
                                ? controller.currentLocation!.address.toString()
                                : '',
                            heading: 'Address',
                            buttonText: 'View Google Map',
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: InformationWidget(
                            text:
                                'Dogfood och Sliders foodtruck. Under Om oss kan ni läsa',
                            heading: 'Book A Table',
                            buttonText: 'Make A Call',
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: InformationWidget(
                            text:
                                'Monday-Friday: 8am - 4pm - Saturday: 9am - 5pm',
                            heading: 'Opening Hours',
                            buttonText: 'Make A Call',
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Expanded(child: NewsLetterWidget()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    const Text(
                      'Copyright 2024, QuomodoSoft. All Rights Reserved.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }
}

class InformationWidget extends StatelessWidget {
  const InformationWidget(
      {super.key,
      required this.heading,
      required this.buttonText,
      required this.text});
  final String heading;
  final String text;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Responsive.mobile(context)
            ? Container()
            : TextButton(
                onPressed: () {},
                child: Text(
                  'Make a call',
                  style: TextStyle(
                      color: AppColors.fOODColor, fontWeight: FontWeight.bold),
                ))
      ],
    );
  }
}

class NewsLetterWidget extends StatelessWidget {
  const NewsLetterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'NewsLetter',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.white,
              )),
              child: const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none),
              ),
            )),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: AppColors.primaryColor),
              child: const Center(
                child: Text(
                  'Send',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
