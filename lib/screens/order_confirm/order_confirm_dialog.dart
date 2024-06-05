// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/providers/upload_cart.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showAnimatedOrderDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const OrderConfirmationAnimatedDialog();
    },
  ).then((value) {});
}

class OrderConfirmationAnimatedDialog extends StatefulWidget {
  const OrderConfirmationAnimatedDialog({super.key});

  @override
  _OrderConfirmationAnimatedDialogState createState() =>
      _OrderConfirmationAnimatedDialogState();
}

class _OrderConfirmationAnimatedDialogState
    extends State<OrderConfirmationAnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int seconds = 4;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _controller.forward();
    startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();

    super.dispose();
  }

  void startTimer() async {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (seconds > 0) {
        seconds--;
      } else {
        timer.cancel();
        var controller =
            Provider.of<FoodEcommerceProvider>(context, listen: false);
        bool uploadorder = await UploadProductsToSupabase.uploadOrder(
            controller.cartListItems.first, context);
        if (uploadorder == true) {
          final mainController =
              Provider.of<FoodEcommerceProvider>(context, listen: false);
          mainController.cartListItems.clear();
          mainController.currentCartUuid = '';
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('cartList');
          mainController.addItemsToCartList();
          ordercompleted = true;
        } else {
          erroroccured = true;
        }
      }
      setState(() {});
    });
  }

  bool ordercompleted = false;
  bool erroroccured = false;

  @override
  Widget build(BuildContext context) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return ScaleTransition(
        scale: _scaleAnimation,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 700,
            height: 500,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Builder(builder: (context) {
                  return Scaffold(
                      body: erroroccured == false
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Image.asset(
                                    ordercompleted == true
                                        ? 'images/completed.gif'
                                        : 'images/waiting.gif',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                ordercompleted == true
                                    ? Container()
                                    : Text(
                                        '$minutes:${remainingSeconds.toString().padLeft(2, '0')}',
                                        style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 52),
                                      ),
                                Text(
                                  ordercompleted == true
                                      ? 'Your order is complete! 🎉 Get ready to indulge in the delightful flavors weve prepared for you. Thank you for choosing Kadyo. Enjoy your meal'
                                      : 'Thank you for placing your order! Please wait a moment while we work our culinary magic. Your delicious meal is in the making!',
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                ordercompleted == true
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          width: 200,
                                          height: 46,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: const Center(
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                      'images/waiting.gif',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const Text(
                                    'Failed To Upload Order',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 20),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 46,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Center(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ));
                })),
          ),
        ));
  }
}
