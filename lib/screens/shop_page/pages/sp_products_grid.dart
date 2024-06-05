import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/product_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/shop_page/pages/add_modifiers_dialog.dart';
import 'package:food_ecommerce/screens/shop_page/pages/sp_addcartwidget.dart';
import 'package:provider/provider.dart';

class FoodItemsGrid extends StatefulWidget {
  const FoodItemsGrid({super.key, required this.data});
  final ProductModel data;

  @override
  State<FoodItemsGrid> createState() => _FoodItemsGridState();
}

class _FoodItemsGridState extends State<FoodItemsGrid> {
  bool ishovering = false;

  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onHover: (hovering) {
          setState(() {
            ishovering = hovering;
          });
        },
        onTap: () {},
        child: Stack(
          children: [
            Card(
              elevation: 0.3,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: SizedBox(
                            width: double.infinity,
                            child: Image.asset('images/chicken.png',
                                fit: BoxFit.cover))),
                    const SizedBox(height: 10),
                    Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text(
                                widget.data.name.toString(),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.headingTextColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14, top: 0, right: 14),
                              child: Text(
                                ' It could refer to a style of cooking, typically involving the outdoor grilling or smoking of meat, often with a flavorful marinade or sauce',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.headingTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14, top: 40, right: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price : £${widget.data.selling_price.toString()}',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: AppColors.headingTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  (mainController.addToCartisLoading &&
                                          mainController.addToCartId ==
                                              widget.data.uuid.toString())
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : TextButton(
                                          onPressed: () async {
                                            mainController.setLoadingAddToCart(
                                                true,
                                                widget.data.uuid.toString());
                                            await mainController
                                                .getModifiersGroupProducts(
                                                    widget.data.uuid.toString())
                                                .then((value) {
                                              if (value.isEmpty) {
                                                mainController.addProductToCart(
                                                    context: context,
                                                    taxtype: 'Included',
                                                    productname: widget
                                                        .data.name
                                                        .toString(),
                                                    modifiersSelected:
                                                        desktopselectedItemsList,
                                                    productUUid: widget
                                                        .data.uuid
                                                        .toString(),
                                                    singlePrice: widget
                                                        .data.selling_price!,
                                                    tax: widget
                                                        .data.selling_price!,
                                                    quantity: 1);
                                              } else {
                                                showAnimatedDialogModifers(
                                                    context,
                                                    value,
                                                    widget.data);
                                              }
                                            });
                                            await mainController
                                                .setLoadingAddToCart(false, '');
                                          },
                                          child: Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: AppColors.primaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            !ishovering
                ? Container()
                : Positioned(
                    top: 30,
                    right: 10,
                    child: Column(
                      children: [
                        AddToCartWidget(callback: () {
                          mainController
                              .getModifiersGroupProducts(
                                  widget.data.uuid.toString())
                              .then((value) {
                            if (value.isEmpty) {
                              mainController.addProductToCart(
                                  context: context,
                                  taxtype: 'Included',
                                  productname: widget.data.name.toString(),
                                  modifiersSelected: desktopselectedItemsList,
                                  productUUid: widget.data.uuid.toString(),
                                  singlePrice: widget.data.selling_price!,
                                  tax: widget.data.selling_price!,
                                  quantity: 1);
                            } else {
                              showAnimatedDialogModifers(
                                  context, value, widget.data);
                            }
                          });
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        !ishovering
                            ? Container()
                            : Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor,
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.favorite,
                                  color: AppColors.whitecolor,
                                )),
                              ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
