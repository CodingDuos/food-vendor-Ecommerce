// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ecommerce/common_widgets/textpaymentwidget.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/models/cart_product_model.dart';

import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/order_confirm/order_confirm_dialog.dart';
import 'package:food_ecommerce/services/alert_notifications.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showOrderFoodDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const OrderFoodDialog();
    },
  ).then((value) {});
}

class OrderFoodDialog extends StatefulWidget {
  const OrderFoodDialog({super.key});

  @override
  _OrderFoodDialogState createState() => _OrderFoodDialogState();
}

class _OrderFoodDialogState extends State<OrderFoodDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  int selectedQunatity = 1;

  Key futureBuilderKey = UniqueKey();
  bool isloaded = false;

  timer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        isloaded = true;
      });
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _scaleAnimation,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            width: 700,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Builder(builder: (context) {
                  return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: isloaded == false
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: SpinKitThreeBounce(
                                  color: AppColors.primaryColor,
                                  size: 50.0,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  width: double.infinity,
                                  child: const OrderFoodBody()),
                            ));
                })),
          ),
        ));
  }

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
    timer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class OrderFoodBody extends StatefulWidget {
  const OrderFoodBody({super.key});

  @override
  State<OrderFoodBody> createState() => _OrderFoodBodyState();
}

class _OrderFoodBodyState extends State<OrderFoodBody> {
  copyToClipboard(
      FoodEcommerceProvider controller, List<CartModel> args) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartlist');
    List<Map<String, dynamic>> cartListMap =
        args.map((cartModel) => cartModel.toMap()).toList();
    String cartListJson = jsonEncode(cartListMap);
    String link =
        'https://sharebasket-6fad7.web.app/asdas/share-basket/$cartListJson';

    String modifiedLink = link.replaceAll('#', '%23');
    Clipboard.setData(ClipboardData(text: modifiedLink));
  }

  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  trailing: InkWell(
                    onTap: () {
                      copyToClipboard(
                          mainController, mainController.cartListItems);
                    },
                    child: Container(
                      width: 200,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.primaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          'Share Link',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  subtitle: Text(
                      '${mainController.currentLocation!.bussinessName.toString()} - ${mainController.currentLocation!.address.toString()}'),
                  title: const Text(
                    'Checkout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryColor,
                      )),
                ),
                buildDeliveryAddress(),
                const SizedBox(height: 5),
                buildPaymentMethod(),
                const SizedBox(height: 5),
                buildOrderSummary(),
                const SizedBox(height: 5),
                const Text(
                    'By completeling this order you agree to our Terms and Conditions'),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
              color: Colors.white,
            ),
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: const Text('Total (incl. VAT)'),
                  trailing: Text(
                    '£.${mainController.cartListItems.first.totalamount.toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text('See Prices breakdown',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold)),
                ),
                MaterialButton(
                  onPressed: () {
                    if (mainController
                        .cartListItems.first.product!.isNotEmpty) {
                      Navigator.of(context).pop();
                      showAnimatedOrderDialog(context);
                    } else {
                      AlertNotifications.showAnimatedSnackBar(
                          context, 'Add Items To Cart First');
                    }
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.primaryColor),
                    child: const Center(
                      child: Text(
                        'Check Out Order',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDeliveryAddress() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.primaryColor,
                  )),
              leading: Icon(
                Icons.location_on_outlined,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'Delivery Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 250,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade200)),
                          child: index == 1
                              ? const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add,
                                          size: 60, color: Colors.grey),
                                      Text(
                                        'Add New Address',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    '1137 Street 46 Islamabad Pakistan',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                        ),
                      );
                    })),
            Divider(
              color: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: AppColors.primaryColor)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Add Delivery Instructions for your rider',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPaymentMethod() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        height: 115,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.primaryColor,
                  )),
              leading: Icon(
                Icons.payment_outlined,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              trailing: const Text(
                'Rs 1,342.99',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.macro_off,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'Visa',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('*** **** **** 1234'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderSummary() {
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                Icons.summarize_outlined,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'Order Summary',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: mainController.cartListItems.first.product!.length,
                itemBuilder: (context, index) {
                  CartProductModel productdata =
                      mainController.cartListItems.first.product![index];
                  return ListTile(
                    subtitle: Wrap(
                      children: productdata.modifiers
                          .map((e) => Text(
                              '( ${e.qty.toString()} x ${e.title.toString()} )   '))
                          .toList(),
                    ),
                    trailing: Text(
                      '£.${productdata.totalPrice.toString()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    title: Text(
                        '${productdata.qty.toString()} x ${productdata.title.toString()}'),
                  );
                }),
            Divider(
              color: Colors.grey.shade200,
            ),
            TextPaymentwidget(
                title: 'Order Total',
                value: mainController.cartListItems.first.totalamount!
                    .toStringAsFixed(2)),
            TextPaymentwidget(
                title: 'Delivery Fee',
                value: mainController.cartListItems.first.totalamount!
                    .toStringAsFixed(2)),
            TextPaymentwidget(
                title: 'Platform Fee',
                value: mainController.cartListItems.first.totalamount!
                    .toStringAsFixed(2)),
            const SizedBox(height: 7)
          ],
        ),
      ),
    );
  }
}
