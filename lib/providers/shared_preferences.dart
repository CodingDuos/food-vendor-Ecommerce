// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  static Future<void> saveCartListToSharedPreferences(
      BuildContext context) async {}

  static Future<void> fetchCartListFromSharedPreferences(
      BuildContext context) async {
    var controller = Provider.of<FoodEcommerceProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartListJson = prefs.getString('cartList');

    if (cartListJson != null && cartListJson.isNotEmpty) {
      controller.cartListItems = cartListFromJson(cartListJson);
    } else {
      controller.addItemsToCartList();
      saveCartListToSharedPreferences(context);
    }
  }

  static String cartListToJson(List<CartModel> cartList) {
    List<Map<String, dynamic>> cartListMap =
        cartList.map((cartModel) => cartModel.toMap()).toList();
    return jsonEncode(cartListMap);
  }

  static List<CartModel> cartListFromJson(String cartListJson) {
    List<dynamic> cartListMap = jsonDecode(cartListJson);
    List<CartModel> cartList = cartListMap
        .map((cartModelMap) => CartModel.fromMap(cartModelMap))
        .toList();
    return cartList;
  }
}
