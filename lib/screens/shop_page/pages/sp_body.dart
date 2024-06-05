// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:food_ecommerce/common_widgets/common_widgets.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';

import 'package:food_ecommerce/models/display_level_categories_model.dart';
import 'package:food_ecommerce/models/product_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';

import 'package:food_ecommerce/screens/shop_page/pages/sp_orders.dart';
import 'package:food_ecommerce/screens/shop_page/pages/sp_product_header.dart';
import 'package:food_ecommerce/screens/shop_page/pages/sp_products_grid.dart';
import 'package:food_ecommerce/screens/shop_page/pages/sp_products_listview.dart';

import 'package:food_ecommerce/services/responsive.dart';
import 'package:provider/provider.dart';

class ShopPageBody extends StatelessWidget {
  const ShopPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    return Container(
      color: AppColors.whitecolor,
      width: screenWidth,
      child: const Stack(
        children: [ShopPageBodyViewWidget()],
      ),
    );
  }
}

class ShopPageBodyViewWidget extends StatefulWidget {
  const ShopPageBodyViewWidget({super.key});

  @override
  State<ShopPageBodyViewWidget> createState() => _ShopPageBodyViewWidgetState();
}

class _ShopPageBodyViewWidgetState extends State<ShopPageBodyViewWidget> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<FoodEcommerceProvider>(context);
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return Padding(
      padding: Responsive.getResponsivePadding(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                width: 450,
                child: Column(
                  children: [
                    YourOrder(),
                  ],
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 10,
                child: Column(
                  children: [
                    const HeaderInformationContainer(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      height: 90,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: mainController.categories.isEmpty
                              ? const SizedBox(
                                  child: Center(
                                    child: Text(''),
                                  ),
                                )
                              : Builder(builder: (context) {
                                  List uniqueCategories = ['All'];

                                  for (var foodItem
                                      in mainController.categories) {
                                    if (uniqueCategories
                                        .where((element) =>
                                            element == foodItem.name)
                                        .toList()
                                        .isEmpty) {
                                      uniqueCategories.add(foodItem);
                                    }
                                  }
                                  return ListView(
                                      scrollDirection: Axis.horizontal,
                                      children:
                                          uniqueCategories.toList().map((e) {
                                        bool isselected = mainController
                                                    .selectedCategory ==
                                                'All'
                                            ? (e is String)
                                            : (e is DisplayLevelCategoriesModel &&
                                                e.name ==
                                                    mainController
                                                        .selectedCategory);

                                        if (e is String) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 5, top: 15),
                                            child: InkWell(
                                              onTap: () {
                                                mainController
                                                    .setSelectedCategory(e, '');
                                                mainController
                                                    .setSelectedSubCategory(
                                                        '', '');
                                              },
                                              child: AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  height: 75,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      color: isselected
                                                          ? AppColors
                                                              .headingTextColor
                                                          : Colors
                                                              .grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        e,
                                                        style: TextStyle(
                                                            color: isselected
                                                                ? Colors.white
                                                                : AppColors
                                                                    .headingTextColor,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          );
                                        }

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 5, top: 15),
                                          child: InkWell(
                                            onTap: () {
                                              mainController
                                                  .setSelectedCategory(
                                                      e.name, e.uuid);
                                              mainController
                                                  .setSelectedSubCategory(
                                                      '', '');
                                            },
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              height: 75,
                                              decoration: BoxDecoration(
                                                  color: isselected
                                                      ? AppColors
                                                          .headingTextColor
                                                      : Colors.grey.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Center(
                                                  child: Text(
                                                    e.name,
                                                    style: TextStyle(
                                                        color: isselected
                                                            ? Colors.white
                                                            : AppColors
                                                                .headingTextColor,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList());
                                })),
                    ),
                    const SizedBox(height: 10),
                    mainController.categories.isEmpty
                        ? const Center(
                            child: Text('No Categories and Items Found'),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: controller.selectedCategoryUUID.isEmpty
                                ? Container()
                                : OneTimeFutureBuilder<
                                        List<DisplayLevelCategoriesModel>>(
                                    key: Key(controller.selectedCategoryUUID
                                        .toString()),
                                    futureFunction: () async {
                                      return mainController
                                          .fetchSubCategoriesList(
                                              controller.selectedCategoryUUID);
                                    },
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.hasError) {
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        } else {
                                          List<DisplayLevelCategoriesModel>
                                              subCategoriesData =
                                              snapshot.data!;
                                          return AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            height: subCategoriesData.isNotEmpty
                                                ? 150
                                                : 0,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    subCategoriesData.length,
                                                itemBuilder: (context, index) {
                                                  bool isSelected = mainController
                                                          .selectedSubCategoryUUID ==
                                                      subCategoriesData[index]
                                                          .uuid;
                                                  return MenuSubCategories(
                                                      uUID: subCategoriesData[
                                                              index]
                                                          .uuid,
                                                      isSelected: isSelected,
                                                      name: subCategoriesData[
                                                              index]
                                                          .name);
                                                }),
                                          );
                                        }
                                      }
                                      return Container();
                                    })),
                    mainController.selectedSubCategoryUUID.isEmpty
                        ? Builder(builder: (context) {
                            var categories = controller.categories
                                .where((element) =>
                                    mainController.selectedCategory == 'All' ||
                                    element.name ==
                                        mainController.selectedCategory)
                                .toList();

                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  return CustomFutureBuilder(
                                    displayLevelUUId: mainController
                                        .currentDisplayLevel!.uuid,
                                    isLoadingIndex: index == 0,
                                    key: ValueKey(categories[index].uuid),
                                    uuid: categories[index].uuid,
                                    builder: (context, productlist) {
                                      return buildCategoryListView(
                                          categories[index].name,
                                          context,
                                          productlist,
                                          mainController.selectedCategory);
                                    },
                                  );
                                });
                          })
                        : Builder(builder: (context) {
                            return OneTimeFutureBuilder<List<ProductModel>>(
                                futureFunction: () async {
                              return mainController.getDisplayLevelProducts(
                                  mainController.selectedSubCategoryUUID);
                            }, builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  List<ProductModel> productDataList =
                                      snapshot.data!;
                                  return buildCategoryListView(
                                      mainController.selectedSubCategory,
                                      context,
                                      productDataList,
                                      mainController.selectedCategory);
                                }
                              }
                              return Container();
                            });
                          }),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

int calculateCrossAxisCount(BuildContext context, double screenWidth) {
  // double itemWidth = 380.0;
  int crossAxisCount = (screenWidth / 300).floor();
  return crossAxisCount < 1 ? 1 : crossAxisCount;
}

List<String> getDistinctCategories(List<DisplayLevelCategoriesModel> items) {
  Set<String> categories = items.map((item) => item.name).toSet();
  return categories.toList();
}

Widget buildCategoryListView(String category, BuildContext context,
    List<ProductModel> productData, String selectedTab) {
  final controller = Provider.of<FoodEcommerceProvider>(context);
  return selectedTab == 'All' && productData.isEmpty
      ? Container()
      : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 40,
                color: AppColors.headingTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          productData.isEmpty
              ? const SizedBox(
                  height: 150,
                  child: Center(
                    child: Text('No Products Found'),
                  ),
                )
              : LayoutBuilder(builder: (context, constraints) {
                  return controller.isgridview
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: productData.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.85,
                                  crossAxisCount: calculateCrossAxisCount(
                                      context, constraints.maxWidth)),
                          itemBuilder: (context, index) {
                            return FoodItemsGrid(data: productData[index]);
                          })
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: productData.length,
                          itemBuilder: (context, index) {
                            return FoodItemsListView(data: productData[index]);
                          });
                }),
          const SizedBox(height: 20),
          productData.isEmpty
              ? const SizedBox(
                  height: 150,
                )
              : const DottedDivider(),
          const SizedBox(height: 20),
        ]);
}

class AddToCartWidget extends StatefulWidget {
  const AddToCartWidget({super.key, required this.callback});
  final Function() callback;

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  bool ishover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (val) {
        ishover = val;
        setState(() {});
      },
      onTap: widget.callback,
      child: Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ishover ? AppColors.primaryColor : null,
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Center(
            child: Icon(
          Icons.shopping_basket_outlined,
          color: ishover ? AppColors.whitecolor : AppColors.primaryColor,
        )),
      ),
    );
  }
}

class MenuSubCategories extends StatelessWidget {
  const MenuSubCategories(
      {super.key,
      required this.isSelected,
      required this.name,
      required this.uUID});
  final bool isSelected;
  final String name;
  final String uUID;

  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return isSelected == true
        ? SizedBox(
            width: 170,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.headingTextColor,
                    border: Border.all(color: Colors.grey.shade300)),
                height: 170,
                child: Stack(
                  children: [
                    Image.asset(
                      'images/leaves.png',
                      color: Colors.white,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'images/35.png',
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/burger.png'),
                          Text(
                            name,
                            style: TextStyle(
                                color: AppColors.whitecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              mainController.setSelectedSubCategory(name, uUID);
            },
            child: SizedBox(
              width: 180,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300)),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/burger.png'),
                      Text(
                        name,
                        style: TextStyle(
                            color: AppColors.headingTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class DottedDivider extends StatelessWidget {
  const DottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 1,
      child: CustomPaint(
        painter: DottedLinePainter(),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.headingTextColor // Change color as needed
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round;

    double dashWidth = 5;
    double dashSpace = 5;
    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
          Offset(currentX, 0), Offset(currentX + dashWidth, 0), paint);
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
