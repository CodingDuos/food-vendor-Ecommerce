// ignore_for_file: library_private_types_in_public_api

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_ecommerce/common_widgets/textpaymentwidget.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/models/cart_product_model.dart';
import 'package:food_ecommerce/models/cart_product_modifier_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/order_confirm/order_confirm_dialog.dart';
import 'package:food_ecommerce/services/alert_notifications.dart';
import 'package:food_ecommerce/services/responsive.dart';
import 'package:provider/provider.dart';

class MyCartPageBody extends StatelessWidget {
  const MyCartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    return Container(
      color: AppColors.whitecolor,
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(top: 500, right: 0, child: Image.asset('images/32.png')),
          Positioned(top: 300, right: 70, child: Image.asset('images/13.png')),
          Positioned(bottom: 0, right: 0, child: Image.asset('images/16.png')),
          Positioned(top: 0, left: 0, child: Image.asset('images/6.png')),
          Positioned(
              bottom: 550, left: 100, child: Image.asset('images/7.png')),
          Positioned(top: 200, left: 0, child: Image.asset('images/13.png')),
          const MycartPageBodyViewWidget()
        ],
      ),
    );
  }
}

class MycartPageBodyViewWidget extends StatelessWidget {
  const MycartPageBodyViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.getResponsivePadding(context),
      child: const Padding(
        padding: EdgeInsets.only(top: 80),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 7,
                child: Column(
                  children: [
                    DeliveryAddress(),
                    SizedBox(height: 40),
                    CartItemsGridList()
                  ],
                )),
            SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [OrderSummary()],
                ))
          ],
        ),
      ),
    );
  }
}

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<FoodEcommerceProvider>(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: AppColors.headingTextColor,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  'Opening Hours',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.whitecolor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  controller.currentLocation!.address.toString(),
                  style: const TextStyle(
                      fontFamily: 'Roboto', color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Builder(builder: (context) {
          List<Map<String, dynamic>> dataList = [
            {'duration': 'Monday - Friday', 'time': '8:00 AM - 10:00 PM'},
            {'duration': 'Saturday', 'time': 'Off'},
            {'duration': 'Delivery Time', 'time': '4:00 PM - 10:00 PM'}
          ];
          return ListView.builder(
              itemCount: dataList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: Icon(Icons.timelapse_outlined,
                          color: AppColors.headingTextColor),
                      title: Text(dataList[index]['duration'] as String),
                      subtitle: Text(dataList[index]['time'] as String),
                    ),
                  ),
                );
              });
        }),
        const SizedBox(height: 10)
      ]),
    );
  }
}

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<FoodEcommerceProvider>(context);
    CartModel cartItems = mainController.cartListItems.first;
    List<String> paymentmethods = [
      'Cash On Delivery',
      'Credit Card',
    ];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 40, right: 20, bottom: 20),
            child: Text(
              'Order Summary',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: AppColors.headingTextColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: paymentmethods.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const SizedBox(width: 40),
                      CircularCheckBox(
                          value: index == 0 ? true : false, onChanged: (v) {}),
                      const SizedBox(width: 20),
                      Text(paymentmethods[index])
                    ],
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 30,
              right: 30,
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Apply Promo Code',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        color: AppColors.headingTextColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          cartItems.product!.isEmpty
              ? const SizedBox(
                  height: 400,
                  child: Center(
                    child: Text('No Item Added to Cart'),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: buildCartListView(cartItems)),
          const TextPaymentwidget(title: 'Subtotal', value: '£35.89'),
          const TextPaymentwidget(title: 'Delivery Fee', value: '£16.00'),
          const TextPaymentwidget(title: 'Coupen Discount', value: '- £48.00'),
          const TextPaymentwidget(title: 'Taxes', value: '£10.00'),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '£42.65',
                  style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: MaterialButton(
              onPressed: () {},
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.headingTextColor)),
                child: Center(
                  child: Text(
                    'Continue with EPOS',
                    style: TextStyle(
                        color: AppColors.headingTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
            child: MaterialButton(
              onPressed: () async {
                if (mainController.currentUser != null) {
                  if (mainController.cartListItems.first.product!.isNotEmpty) {
                    showAnimatedOrderDialog(context);
                  } else {
                    AlertNotifications.showAnimatedSnackBar(
                        context, 'Add Items To Cart First');
                  }
                } else {
                  AlertNotifications.showAnimatedSnackBar(
                      context, 'Please Sign in or create New Account first');
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.headingTextColor),
                child: const Center(
                  child: Text(
                    'Confirm Order',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            width: double.infinity,
            color: const Color(0xffCC3333),
            child: Stack(
              children: [
                Positioned(
                    top: 10, child: Image.asset('images/transparent2.png')),
                const Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 120,
                      child: Center(
                        child: Icon(
                          Icons.discount,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Earn 5% cash back on Today',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          'Learn more',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 3,
                              decorationStyle: TextDecorationStyle.solid,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildCartItems(var cartItems) {
    return cartItems.product!.isEmpty
        ? const SizedBox(
            height: 400,
            child: Center(
              child: Text('No Item Added to Cart'),
            ),
          )
        : buildCartListView(cartItems);
  }

  Widget buildCartListView(var cartItems) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cartItems.product!.length,
      itemBuilder: (context, index) {
        return buildCartItem(cartItems.product![index], index);
      },
    );
  }

  Widget buildCartItem(CartProductModel productData, int index) {
    final mainController = Provider.of<FoodEcommerceProvider>(context);

    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? 0 : 10, left: 10, right: 10),
      child: DottedBorder(
        color: AppColors.headingTextColor,
        strokeWidth: 0.2,
        child: Column(
          children: [
            buildProductDetails(productData, mainController),
            SizedBox(height: productData.modifiers.isEmpty ? 0 : 10),
            buildModifiersList(productData),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildProductDetails(CartProductModel productData, var mainController) {
    return Row(
      children: [
        buildProductImage(),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${productData.title} ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ),
        buildQuantityControls(productData, mainController),
        const SizedBox(width: 10),
        buildDeleteButton(),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: const Color(0xffFFF7DD),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Image.asset(
              'images/mi-4.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuantityControls(
      CartProductModel productData, FoodEcommerceProvider mainController) {
    return Row(
      children: [
        buildQuantityButton(Icons.remove, () {
          mainController.updatingProductQuantity(productData, false, context);
        }),
        const SizedBox(width: 5),
        Text(
          productData.qty.toString(),
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(
          'x ${productData.singlePrice.toString()}',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 5),
        buildQuantityButton(Icons.add, () {
          mainController.updatingProductQuantity(productData, true, context);
        }),
      ],
    );
  }

  Widget buildQuantityButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Center(
          child: Icon(icon, color: AppColors.primaryColor),
        ),
      ),
    );
  }

  Widget buildDeleteButton() {
    return SizedBox(
      width: 30,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.delete,
          color: AppColors.headingTextColor,
          size: 25,
        ),
      ),
    );
  }

  Widget buildModifiersList(CartProductModel productData) {
    return Builder(
      builder: (context) {
        productData.modifiers.sort(
            (a, b) => a.modifiersGroupName!.compareTo(b.modifiersGroupName!));

        return Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: ListView.builder(
            itemCount: productData.modifiers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              CartProductModifier modifiers = productData.modifiers[index];
              return buildModifierItem(productData, modifiers);
            },
          ),
        );
      },
    );
  }

  Widget buildModifierItem(
      CartProductModel productData, CartProductModifier modifiers) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 40),
                    Text(modifiers.title.toString()),
                    Text(' (£${modifiers.totalPrice})'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildQuantityButton(Icons.remove, () {
                      subtractModifiersQunatity(productData, modifiers);
                    }),
                    const SizedBox(width: 5),
                    Text('${modifiers.qty} X'),
                    const SizedBox(width: 5),
                    buildQuantityButton(Icons.add, () {
                      addModifiersQunatity(productData.uuid, modifiers);
                    }),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPromoCodeSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Apply Promo Code',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Container(
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                  color: AppColors.headingTextColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  'Apply',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPaymentDetails() {
    final mainController = Provider.of<FoodEcommerceProvider>(context);
    return Column(
      children: [
        TextPaymentwidget(
            title: 'Subtotal',
            value: mainController.cartListItems.first.totalamount!
                .toStringAsFixed(2)),
        const TextPaymentwidget(title: 'Order Total', value: '£16.00'),
      ],
    );
  }

  subtractModifiersQunatity(var productData, var modifiers) {
    final mainController =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    CartModel cartItems = mainController.cartListItems.first;
    final productMatches =
        cartItems.product?.where((element) => element.uuid == productData.uuid);

    if (productMatches != null && productMatches.isNotEmpty) {
      final product = productMatches.first;
      final matchingModifiers = product.modifiers;
      final matchingModifierIndex =
          matchingModifiers.indexWhere((element) => element == modifiers);

      if (matchingModifierIndex != -1) {
        matchingModifiers[matchingModifierIndex].qty =
            (matchingModifiers[matchingModifierIndex].qty ?? 0) - 1;

        if (matchingModifiers[matchingModifierIndex].qty == 0) {
          matchingModifiers.removeAt(matchingModifierIndex);
        }
      }
    }

    mainController.refresh();
  }

  addModifiersQunatity(var productData, var modifiers) {
    final mainController =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    CartModel cartItems = mainController.cartListItems.first;
    final productMatches =
        cartItems.product?.where((element) => element.uuid == productData);

    if (productMatches != null && productMatches.isNotEmpty) {
      final product = productMatches.first;
      final matchingModifier = product.modifiers.firstWhere(
        (element) => element == modifiers,
      );

      matchingModifier.qty = (matchingModifier.qty ?? 0) + 1;
    }

    mainController.refresh();
  }
}

class CircularCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CircularCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  _CircularCheckBoxState createState() => _CircularCheckBoxState();
}

class _CircularCheckBoxState extends State<CircularCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged?.call(!widget.value);
      },
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: widget.value
            ? Center(
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryColor),
                      color: AppColors.primaryColor),
                ),
              )
            : null,
      ),
    );
  }
}

class CartItemsGridList extends StatelessWidget {
  const CartItemsGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Information',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.headingTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Row(
            children: [
              Expanded(
                  child: TextFieldWidgetCart(
                      title: 'Full Name', hintText: 'Enter Full Name')),
              Expanded(
                  child: TextFieldWidgetCart(
                      title: 'Phone Number', hintText: 'Enter Phone Number')),
              Expanded(
                  child: TextFieldWidgetCart(
                      title: 'Email', hintText: 'Enter Email Address')),
            ],
          ),
          const TextFieldWidgetCart(
              title: 'Choose Delivery Time',
              hintText: 'ASAP by default, or click to see the time'),
          const TextFieldWidgetCart(
              title: 'Special Instructions',
              hintText:
                  'Add any comments, e.g: about allergies , or delivery instructions'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TextFieldWidgetCart extends StatelessWidget {
  const TextFieldWidgetCart(
      {super.key,
      required this.hintText,
      this.controller,
      required this.title});
  final String hintText;
  final String title;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Container(
            height: 55,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  border: InputBorder.none,
                  hintText: hintText),
            ),
          ),
        ],
      ),
    );
  }
}
