// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_null_comparison, depend_on_referenced_packages

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/models/customer_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/services/responsive.dart';
import 'package:provider/provider.dart';

class DashBoardViewScreen extends StatefulWidget {
  const DashBoardViewScreen({super.key, required this.storeId});
  final String storeId;

  @override
  State<DashBoardViewScreen> createState() => _DashBoardViewScreenState();
}

class _DashBoardViewScreenState extends State<DashBoardViewScreen> {
  @override
  void initState() {
    fetchstoreId();
    super.initState();
  }

  fetchstoreId() async {
    final controller =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    await controller.setstoreId(widget.storeId.toString());
    await controller.fetchDataFromSupabase('stores', context);
    await controller.setselectedTab('Home');
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
        print('${controller.cartListItems.first.customer_id}currentuser.uuid');
        controller.refresh();
      } catch (e) {
        print(e);
      }
    }
    await controller.fetchDataFromSupabase('services', context);
    await controller.fetchDataFromSupabase('countries', context);
    await controller.setLoading(true);
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
          : const DashBoardViewBodyScreen(),
    );
  }
}

class DashBoardViewBodyScreen extends StatelessWidget {
  const DashBoardViewBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FoodEcommerceProvider>(context);

    return ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: Responsive.mobile(context)
            ? controller.getMobileViewBodyScreen.length
            : controller.getDashboardViewBodyScreen.length,
        itemBuilder: (context, index) {
          return Responsive.mobile(context)
              ? controller.getMobileViewBodyScreen[index]
              : controller.getDashboardViewBodyScreen[index];
        });
  }
}
