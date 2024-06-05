// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';

import 'package:food_ecommerce/providers/dashboard_provider.dart';

import 'package:food_ecommerce/screens/authentication/authentication_view.dart';

import 'package:provider/provider.dart';

class MobileHeaderViewPageBody extends StatelessWidget {
  const MobileHeaderViewPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * 0.17,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                Image.asset('images/logo.png'),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Center(
                    child: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ));
  }

  void showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AuthenticatedAnimatedDialog();
      },
    ).then((value) {
      final controller =
          Provider.of<FoodEcommerceProvider>(context, listen: false);
      controller.setselectedShowDialog('Login');
    });
  }
}

class HomeTitlesWidget extends StatefulWidget {
  const HomeTitlesWidget({super.key, required this.selectedPageName});
  final String selectedPageName;

  @override
  State<HomeTitlesWidget> createState() => _HomeTitlesWidgetState();
}

class _HomeTitlesWidgetState extends State<HomeTitlesWidget> {
  bool ishovering = false;

  @override
  Widget build(BuildContext context) {
    String textToMeasure = widget.selectedPageName;

    // Create a TextPainter
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: textToMeasure,
        style: const TextStyle(fontSize: 18),
      ),
      textDirection: TextDirection.ltr,
    );

    // Layout the text
    textPainter.layout();

    // Get the width of the text
    double textWidth = textPainter.width;
    return InkWell(
      onTap: () {
        final controller =
            Provider.of<FoodEcommerceProvider>(context, listen: false);
        controller.setselectedTab(widget.selectedPageName);

        navigateNewScreen(context, widget.selectedPageName);
      },
      onHover: (val) {
        ishovering = val;
        setState(() {});
      },
      child: SizedBox(
        width: 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.selectedPageName,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: widget.selectedPageName ==
                          Provider.of<FoodEcommerceProvider>(context,
                                  listen: false)
                              .selectedTab
                      ? AppColors.fOODColor
                      : AppColors.whitecolor,
                  fontSize: 18,
                  fontWeight: widget.selectedPageName ==
                          Provider.of<FoodEcommerceProvider>(context,
                                  listen: false)
                              .selectedTab
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2, top: 4),
                child: AnimatedContainer(
                  curve: Curves.bounceIn,
                  duration: const Duration(milliseconds: 600),
                  color: widget.selectedPageName ==
                          Provider.of<FoodEcommerceProvider>(context,
                                  listen: false)
                              .selectedTab
                      ? AppColors.fOODColor
                      : AppColors.primaryColor,
                  height: 4,
                  width: ishovering ? textWidth : 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
