// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/customer_model.dart';
import 'package:food_ecommerce/providers/authentication_repository.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/authentication/widgets/textfield_widget.dart';
import 'package:food_ecommerce/services/fetch_supabase.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isobserve = false;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FoodEcommerceProvider>(context);
    return ListView(
      children: [
        Image.asset(
          'images/logo.png',
          height: 70,
          color: AppColors.primaryColor,
        ),
        TextFieldWidget(hintText: 'Email', controller: emailController),
        TextFieldWidget(
            hintText: 'Password',
            controller: passwordController,
            iconbutton: IconButton(
                onPressed: () {
                  setState(() {
                    isobserve = !isobserve;
                  });
                },
                icon: Icon(isobserve == true
                    ? Icons.visibility
                    : Icons.visibility_off)),
            observe: isobserve),
        controller.authenticationError.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        controller.authenticationError,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    )
                  ],
                ),
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
          child: Row(
            children: [
              Checkbox(value: false, onChanged: (val) {}),
              const SizedBox(width: 10),
              const Text('I trust this browser')
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 10),
          child: MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: () async {
              if (emailController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                controller.setAuthenticationError('Please fill all fields');
              } else {
                controller.setAuthenticationError('');
                controller.setAuthenticationLoading(true);
                bool isauthenticated =
                    await AuthenticationRepository.loginCustomer(
                        context: context,
                        email: emailController.text,
                        password: passwordController.text);

                if (isauthenticated == true) {
                  final response = await supbaseClient
                      .from('customers')
                      .select()
                      .eq('email', emailController.text)
                      .select();
                  List<CustomerModel> data =
                      (response).map((e) => CustomerModel.fromMap(e)).toList();
                  CustomerModel currentuser = data.first;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('currentUser');
                  List<Map<String, dynamic>> userMap =
                      data.map((cartModel) => currentuser.toMap()).toList();
                  String usersData = jsonEncode(userMap);
                  await prefs.setString('currentUser', usersData);

                  controller.cartListItems.first.customer_id = currentuser.uuid;
                  controller.refresh();
                  controller.setAuthentication(currentuser);
                  Navigator.of(context).pop('navigate');
                  controller.setselectedShowDialog('Login');
                } else {
                  controller.setAuthenticationError('Invalid Credentials');
                }
                controller.setAuthenticationLoading(false);
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.primaryColor),
              child: Center(
                  child: controller.autenticationLoading == false
                      ? const Text(
                          'Sign in',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        )
                      : Center(
                          child: SpinKitThreeBounce(
                            color: AppColors.whitecolor,
                            size: 20,
                          ),
                        )),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              controller.setselectedShowDialog('ForgetPassword');
            },
            child: Text(
              'I forgot my password',
              style: TextStyle(
                  color: AppColors.headingTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            )),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CONNECT WITH',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 14),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100, bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Row(
                        children: [
                          Image.asset('images/google.png'),
                          const SizedBox(width: 20),
                          const Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Row(
                        children: [
                          Image.asset('images/fb.png'),
                          const SizedBox(width: 20),
                          const Text(
                            'Facebook',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              controller.setselectedShowDialog('signup');
            },
            child: Text(
              'Dont have an account?',
              style: TextStyle(
                  color: AppColors.headingTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            )),
      ],
    );
  }
}
