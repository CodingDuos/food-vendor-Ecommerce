// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/services/fetch_supabase.dart';

class UploadProductsToSupabase {
  static Future<bool> uploadOrder(
      CartModel cartData, BuildContext context) async {
    print(cartData);
    try {
      await supbaseClient.from('orders').insert({
        'uuid': cartData.uuid.toString(),
        'order_status_id': cartData.orderStatusId,
        'service_id': cartData.service_id.toString(),
        'order_ticket_status_id': cartData.order_ticket_status_id.toString(),
        'sale_channel_id': cartData.sale_channel_id.toString(),
        'location_id': cartData.location_id.toString(),
        'customer_uuid': cartData.customer_id.toString(),
        'order_track_number': cartData.orderNumber.toString(),
        'total_amount': cartData.totalamount.toString(),
        'products': cartData.product!
            .map((product) => {
                  'uuid': product.uuid,
                  'title': product.title,
                  'singlePrice': product.singlePrice,
                  'qty': product.qty,
                  'tax': product.tax,
                  'weight': product.weight,
                  'groupUuid': product.groupUuid,
                  'localId': product.localId,
                  'taxType': product.taxType,
                  'productTypeId': product.productTypeId,
                  'categoryUuid': product.categoryUuid,
                  'brandUuid': product.brandUuid,
                  'departmentUuid': product.departmentUuid,
                  'modifiers': product.modifiers
                      .map((modifier) => modifier.toMapSupaBase())
                      .toList(),
                })
            .toList()
      }).then((value) async {});
      return true;
    } catch (error) {
      // Handle the error here
      print('Error uploading order: $error');
      return false;
    }
  }
}
