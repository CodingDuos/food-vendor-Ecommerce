// ignore_for_file: use_build_context_synchronously, deprecated_member_use, avoid_print, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/models/customer_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/services/responsive.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShopPageViewScreen extends StatefulWidget {
  const ShopPageViewScreen({super.key, this.productid, this.storeId});
  final String? productid;
  final String? storeId;

  @override
  State<ShopPageViewScreen> createState() => _ShopPageViewScreenState();
}

class _ShopPageViewScreenState extends State<ShopPageViewScreen> {
  @override
  void initState() {
    fetchstoreId();
    super.initState();
  }

  fetchstoreId() async {
    final controller =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    await controller.setstoreId(widget.storeId.toString());
    var waiting = await controller.fetchDataFromSupabase('stores', context);
    if (waiting != false) {
      print(waiting);
      await controller.setselectedTab('Menu');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cartListJsons = prefs.getString('cartList');
      String? userlistJson = prefs.getString('currentUser');

      if (cartListJsons != null && cartListJsons.isNotEmpty) {
        try {
          var data = jsonDecode(cartListJsons);
          controller.cartListItems = (data as List<dynamic>)
              .map((e) => CartModel.fromMap(e as Map<String, dynamic>))
              .toList();
          controller.refresh();
        } catch (e) {
          print(e);
        }
      } else {
        prefs.remove('cartList');
        await controller.addItemsToCartList();
        List<Map<String, dynamic>> cartListMap = controller.cartListItems
            .map((cartModel) => cartModel.toMap())
            .toList();
        String cartListJson = jsonEncode(cartListMap);
        await prefs.setString('cartList', cartListJson);
      }
      if (userlistJson != null && userlistJson.isNotEmpty) {
        try {
          var data = jsonDecode(userlistJson);
          List<CustomerModel> userdata = (data as List<dynamic>)
              .map((e) => CustomerModel.fromMap(e as Map<String, dynamic>))
              .toList();
          CustomerModel currentuser = userdata.first;
          controller.setAuthentication(currentuser);
          controller.cartListItems.first.customer_id = currentuser.uuid;

          controller.refresh();
        } catch (e) {
          print(e);
        }
      }
      print(controller.cartListItems);
      await controller.fetchDataFromSupabase('services', context);
      await controller.fetchDataFromSupabase('countries', context);
      await controller.setLoading(true);
    } else {
      controller.currentStore = null;
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FoodEcommerceProvider>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: controller.isLoadingAllCheckedConditions == false
          ? Center(
              child: SpinKitThreeBounce(
                color: AppColors.primaryColor,
                size: 50.0,
              ),
            )
          : Responsive.mobile(context)
              ? Container(
                  height: 70,
                  color: Colors.black,
                  child: Row(
                    children: [
                      {'name': 'Home', 'icon': Icons.home_filled},
                      {'name': 'Cart', 'icon': Icons.shopping_basket},
                      {'name': 'Wishlist', 'icon': Icons.favorite},
                      {'name': 'Account', 'icon': Icons.account_circle},
                    ]
                        .map((e) => Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  e['icon'] as IconData,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  e['name'] as String,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )))
                        .toList(),
                  ),
                )
              : Container(),
      body: controller.isLoadingAllCheckedConditions == false
          ? Center(
              child: SpinKitThreeBounce(
                color: AppColors.primaryColor,
                size: 50.0,
              ),
            )
          : const ShopPageViewBodyScreen(),
    );
  }
}

class ShopPageViewBodyScreen extends StatelessWidget {
  const ShopPageViewBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: ListView(
          controller: controller.shopPagelistviewController,
          children: [
            // const HeaderViewPageBody(),
            ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: Responsive.mobile(context)
                    ? controller.geShopPagesScreensMobile.length
                    : controller.geShopPagesScreens.length,
                itemBuilder: (context, index) {
                  return Responsive.mobile(context)
                      ? controller.geShopPagesScreensMobile[index]
                      : controller.geShopPagesScreens[index];
                })
          ]),
    );
  }
}
