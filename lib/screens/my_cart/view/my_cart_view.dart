// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_null_comparison, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/models/customer_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MycartViewScreen extends StatefulWidget {
  const MycartViewScreen({super.key, this.productid, this.storeId});
  final String? productid;
  final String? storeId;

  @override
  State<MycartViewScreen> createState() => _MycartViewScreenState();
}

class _MycartViewScreenState extends State<MycartViewScreen> {
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
    await controller.setselectedTab('My Cart');
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

    await controller.fetchDataFromSupabase('services', context);
    await controller.fetchDataFromSupabase('countries', context);
    await controller.setLoading(true);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FoodEcommerceProvider>(context);
    return Scaffold(
      body: controller.isLoadingAllCheckedConditions == false
          ? Center(
              child: SpinKitThreeBounce(
                color: AppColors.primaryColor,
                size: 50.0,
              ),
            )
          : const MyCartPageViewBodyScreen(),
    );
  }
}

class MyCartPageViewBodyScreen extends StatelessWidget {
  const MyCartPageViewBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    return ListView(children: [
      ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: controller.getMyCartPagesScreens.length,
          itemBuilder: (context, index) {
            return controller.getMyCartPagesScreens[index];
          })
    ]);
  }
}
