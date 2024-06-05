// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_ecommerce/models/customer_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/services/fetch_supabase.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AuthenticationRepository {
  static Future createUserInformation(
      {required String firstName,
      required String lastName,
      required String phone,
      required BuildContext context,
      required String email}) async {
    final controller =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    try {
      await supbaseClient.from('customers').insert({
        'uuid': const Uuid().v4().toString(),
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
      }).then((value) async {
        final response = await supbaseClient
            .from('customers')
            .select()
            .eq('email', email)
            .select();
        List<CustomerModel> data =
            (response).map((e) => CustomerModel.fromMap(e)).toList();
        CustomerModel currentuser = data.first;
        controller.cartListItems.first.customer_id = currentuser.uuid;
        controller.refresh();
        controller.setAuthentication(currentuser);

        Navigator.of(context).pop();
      });
    } catch (error) {
      print('Error uploading order: $error');
    }
  }

  static Future<bool> loginCustomer(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final response = await supbaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        return false;
      }

      return true;
    } catch (error) {
      final controller =
          Provider.of<FoodEcommerceProvider>(context, listen: false);
      controller.setAuthenticationError('Error While sign in : $error');

      return false;
    }
  }

  static signUpCustomer(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String phone,
      required BuildContext context}) async {
    final controller =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    try {
      print('object ads');
      await supbaseClient.auth
          .signUp(email: email, password: password)
          .then((value) async {
        if (value.user!.email == email) {
          print(email);
          await createUserInformation(
              context: context,
              firstName: firstName,
              lastName: lastName,
              email: email,
              phone: phone);
        } else {
          controller.setAuthenticationError('Something went wrong');
        }
      });
    } catch (error) {
      controller.setAuthenticationError('Error uploading order: $error');
    }
  }

  static Future updatePassword(
      {required String email, required BuildContext context}) async {
    final controller =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    try {
      await supbaseClient.auth.resetPasswordForEmail(email);
    } catch (error) {
      controller.setAuthenticationError(
          'Error sending reset password request: $error');
    }
  }
}
