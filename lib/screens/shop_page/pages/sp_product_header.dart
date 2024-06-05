import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ecommerce/common_widgets/common_widgets.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/product_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/shop_page/pages/add_modifiers_dialog.dart';
import 'package:provider/provider.dart';

class HeaderInformationContainer extends StatefulWidget {
  const HeaderInformationContainer({super.key});

  @override
  State<HeaderInformationContainer> createState() =>
      _HeaderInformationContainerState();
}

class _HeaderInformationContainerState
    extends State<HeaderInformationContainer> {
  bool isDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Container(
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {
                      mainController.setisgridview(true);
                    },
                    icon: Icon(
                      Icons.grid_view,
                      color: mainController.isgridview == true
                          ? AppColors.primaryColor
                          : null,
                    )),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {
                      mainController.setisgridview(false);
                    },
                    icon: Icon(
                      Icons.list,
                      color: mainController.isgridview == false
                          ? AppColors.primaryColor
                          : null,
                    )),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: mainController.searchController,
                      onChanged: (value) {
                        if (value.isNotEmpty && !isDialogOpen) {
                          showOverlayDialog(context);
                        } else if (value.isEmpty && isDialogOpen) {
                          isDialogOpen = false;
                        }
                        mainController.refresh();
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                          hintText: 'Search Food Item'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('Sort By :'),
                const SizedBox(
                  width: 10,
                ),
                const Text('Short By Price :'),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'High to Low',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const Icon(Icons.arrow_drop_down_sharp),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          if (isDialogOpen)
            AnimatedOverlayDialog(
              issearched: isDialogOpen,
            ),
        ],
      ),
    );
  }

  void showOverlayDialog(BuildContext context) {
    setState(() {
      isDialogOpen = true;
    });
  }
}

class AnimatedOverlayDialog extends StatelessWidget {
  const AnimatedOverlayDialog({
    super.key,
    required this.issearched,
  });
  final bool issearched;

  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return Material(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedContainer(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)),
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Builder(builder: (context) {
                return OneTimeFutureBuilder(
                    key: Key(mainController.searchController.text),
                    futureFunction: () async {
                      return mainController.searchProductOfModifiers();
                    },
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: SpinKitThreeBounce(
                            color: AppColors.primaryColor,
                            size: 50.0,
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<ProductModel> productdata = [];
                          if (snapshot.data != null &&
                              snapshot.data.length > 0) {
                            productdata = snapshot.data;
                          }
                          return productdata.isEmpty
                              ? const SizedBox(
                                  height: 300,
                                  child: Center(
                                    child: Text(
                                        'No Product Found Of Search Filter'),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: productdata.length,
                                  itemBuilder: (context, index) {
                                    var data = productdata[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.grey.shade300)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                radius: 70,
                                                backgroundColor:
                                                    const Color(0xffFFF7DD),
                                                child: Center(
                                                  child: Image.asset(
                                                      'images/mi-4.png'),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                child: ListTile(
                                              title: Text(
                                                '${productdata[index].name.toString()}   x   £${productdata[index].selling_price.toString()}',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: AppColors
                                                      .headingTextColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )),
                                            MaterialButton(
                                              onPressed: () {
                                                mainController
                                                    .getModifiersGroupProducts(
                                                        data.uuid.toString())
                                                    .then((value) {
                                                  if (value.isEmpty) {
                                                    mainController.addProductToCart(
                                                        context: context,
                                                        taxtype: 'Included',
                                                        productname: data.name
                                                            .toString(),
                                                        modifiersSelected:
                                                            desktopselectedItemsList,
                                                        productUUid: data.uuid
                                                            .toString(),
                                                        singlePrice:
                                                            data.selling_price!,
                                                        tax:
                                                            data.selling_price!,
                                                        quantity: 1);
                                                  } else {
                                                    showAnimatedDialogModifers(
                                                        context, value, data);
                                                  }
                                                });
                                              },
                                              child: Container(
                                                width: 150,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color:
                                                        AppColors.primaryColor),
                                                child: const Center(
                                                  child: Text(
                                                    'Add to Cart',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10)
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                        }
                      }
                      return Container();
                    });
              }),
            ),
          )),
    );
  }
}
