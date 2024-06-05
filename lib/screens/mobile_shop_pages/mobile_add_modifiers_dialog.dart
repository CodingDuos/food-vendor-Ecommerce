// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ecommerce/common_widgets/common_manage_qunatity.dart';
import 'package:food_ecommerce/common_widgets/common_widgets.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/modifier_display_level_group.dart';
import 'package:food_ecommerce/models/mofiers_model.dart';
import 'package:food_ecommerce/models/product_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/my_cart/pages/mc_body.dart';

import 'package:provider/provider.dart';

void showAnimatedDialogModifersMobile(
    BuildContext context,
    List<ModifiersDisplayLevelModelGroup> foodItemDetailData,
    final ProductModel productItem) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ModifersDialogMobile(
        productItem: productItem,
        foodItemDetailData: foodItemDetailData,
      );
    },
  ).then((value) {
    desktopselectedItemsList.clear();
  });
}

class ModifersDialogMobile extends StatefulWidget {
  const ModifersDialogMobile(
      {super.key, required this.foodItemDetailData, required this.productItem});
  final List<ModifiersDisplayLevelModelGroup> foodItemDetailData;
  final ProductModel productItem;

  @override
  _ModifersDialogState createState() => _ModifersDialogState();
}

class _ModifersDialogState extends State<ModifersDialogMobile>
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
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return ScaleTransition(
        scale: _scaleAnimation,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            width: 700,
            height: 800,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Select Modifiers',
                                        style: TextStyle(
                                            color: AppColors.headingTextColor,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView(
                                        children: [
                                          for (ModifiersDisplayLevelModelGroup modifiers
                                              in widget.foodItemDetailData)
                                            Column(
                                              children: [
                                                const SizedBox(height: 10),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color:
                                                          Colors.grey.shade300),
                                                  height: 40,
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(width: 20),
                                                      Text(
                                                        modifiers.group_name
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                OneTimeFutureBuilder<
                                                    List<ModifiersModel>>(
                                                  futureFunction: () async {
                                                    return mainController
                                                        .getModifiersofGroupAndProducts(
                                                            modifiers
                                                                .modifier_group_uuid
                                                                .toString(),
                                                            widget.productItem
                                                                .uuid
                                                                .toString());
                                                  },
                                                  builder: (context, snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.done) {
                                                      return ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: snapshot
                                                            .data!.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          ModifiersModel
                                                              submodifers =
                                                              snapshot
                                                                  .data![index];

                                                          return Column(
                                                            children: [
                                                              const SizedBox(
                                                                  height: 10),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                                height: 50,
                                                                child: Row(
                                                                  children: [
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                    CircularCheckBox(
                                                                      value: submodifers
                                                                          .isselected!,
                                                                      onChanged:
                                                                          (bool?
                                                                              value) {
                                                                        setState(
                                                                            () {
                                                                          submodifers.isselected =
                                                                              value!;

                                                                          if (value ==
                                                                              true) {
                                                                            desktopselectedItemsList.add(
                                                                              SelectedItem(modifiers.group_name.toString(), submodifers, modifiers.modifier_group_uuid.toString()),
                                                                            );
                                                                          } else {
                                                                            desktopselectedItemsList.removeWhere((item) =>
                                                                                item.parentGroupName == modifiers.group_name.toString() &&
                                                                                item.selectedItem == submodifers);
                                                                          }
                                                                        });
                                                                      },
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            10),
                                                                    Text(
                                                                      submodifers
                                                                          .name
                                                                          .toString(),
                                                                      style:
                                                                          const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      ' (£${submodifers.totalPrice.toString()})',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    ),
                                                                    const Spacer(),
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                    ManageQuantityCommonWidget(
                                                                      onremove:
                                                                          () {
                                                                        submodifers
                                                                            .quantity = submodifers
                                                                                .quantity! -
                                                                            1;
                                                                        if (submodifers.quantity! ==
                                                                            0) {
                                                                          submodifers.isselected =
                                                                              false;
                                                                          submodifers.quantity =
                                                                              1;
                                                                          desktopselectedItemsList.removeWhere((item) =>
                                                                              item.parentGroupName == modifiers.group_name.toString() &&
                                                                              item.selectedItem == submodifers);
                                                                        }
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      onadd:
                                                                          () {
                                                                        submodifers
                                                                            .quantity = submodifers
                                                                                .quantity! +
                                                                            1;
                                                                        if (submodifers.isselected ==
                                                                            false) {
                                                                          desktopselectedItemsList
                                                                              .add(
                                                                            SelectedItem(
                                                                                modifiers.group_name.toString(),
                                                                                submodifers,
                                                                                modifiers.modifier_group_uuid.toString()),
                                                                          );
                                                                          submodifers.isselected =
                                                                              true;
                                                                        }
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      qunatity: submodifers
                                                                          .quantity
                                                                          .toString(),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                    return const CircularProgressIndicator();
                                                  },
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    )),
                                    Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300)),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: SizedBox(
                                                  height: 170,
                                                  width: double.infinity,
                                                  child: Image.asset(
                                                      'images/sandwich.png',
                                                      fit: BoxFit.cover))),
                                          Expanded(
                                              flex: 7,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14, top: 5),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '£${widget.productItem.selling_price}   x   ${widget.productItem.name}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: AppColors
                                                                .headingTextColor,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14),
                                                    child: Text(
                                                      'It is a long established fact that a reader BBQ food Chicken.',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: AppColors
                                                            .headingTextColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14,
                                                            top: 20,
                                                            right: 14),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Price : £15.00',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: AppColors
                                                                  .headingTextColor,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Row(
                                                          children: [
                                                            const SizedBox(
                                                                width: 20),
                                                            InkWell(
                                                              onTap: () async {
                                                                subtractQunatity();
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .primaryColor)),
                                                                child: Center(
                                                                  child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: AppColors
                                                                          .primaryColor),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 20),
                                                            Text(
                                                              selectedQunatity
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 22),
                                                            ),
                                                            const SizedBox(
                                                                width: 20),
                                                            InkWell(
                                                              onTap: () {
                                                                addQunatity();
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .primaryColor)),
                                                                child: Center(
                                                                  child: Icon(
                                                                      Icons.add,
                                                                      color: AppColors
                                                                          .primaryColor),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            MaterialButton(
                                              onPressed: () async {
                                                await mainController
                                                    .addProductToCart(
                                                        context: context,
                                                        taxtype: 'Included.',
                                                        productname: widget
                                                            .productItem.name
                                                            .toString(),
                                                        modifiersSelected:
                                                            desktopselectedItemsList,
                                                        productUUid: widget
                                                            .productItem.uuid
                                                            .toString(),
                                                        singlePrice: widget
                                                            .productItem
                                                            .selling_price!,
                                                        tax: widget.productItem
                                                            .selling_price!,
                                                        quantity:
                                                            selectedQunatity)
                                                    .then((value) =>
                                                        Navigator.of(context)
                                                            .pop());
                                              },
                                              child: Container(
                                                  width: 400,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: AppColors
                                                          .primaryColor),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12,
                                                            right: 12),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '£${(selectedQunatity * widget.productItem.selling_price!) + desktopselectedItemsList.fold(0, (previousValue, element) => previousValue + (element.selectedItem.quantity! * element.selectedItem.sale_price!))} ',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 22),
                                                        ),
                                                        const Text(
                                                          'Add to Cart',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 22),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ));
                })),
          ),
        ));
  }

  subtractQunatity() {
    if (selectedQunatity > 1) {
      setState(() {
        selectedQunatity--;
      });
    }
  }

  addQunatity() {
    setState(() {
      selectedQunatity++;
    });
  }

  // addToCartItemFunction(var controller) {
  //   selectedModifiers.clear();
  //   for (var modifier in widget.foodItemDetailData.modifiers) {
  //     var selectedSubModifiers = modifier.submodifers
  //         .where((subModifier) => subModifier.isselected)
  //         .toList();
  //     if (selectedSubModifiers.isNotEmpty) {
  //       selectedModifiers.add(Modifiers(
  //         name: modifier.name,
  //         submodifers: selectedSubModifiers,
  //       ));
  //     }
  //   }
  //   var item = FoodItem(
  //       modifiers: selectedModifiers,
  //       name: widget.foodItemDetailData.name,
  //       price: widget.foodItemDetailData.price,
  //       description: widget.foodItemDetailData.description,
  //       quantity: selectedQunatity,
  //       category: widget.foodItemDetailData.category);
  //   controller.addcartList(item);

  //   Navigator.of(context).pop();
  // }

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

List<SelectedItem> desktopselectedItemsList = [];
