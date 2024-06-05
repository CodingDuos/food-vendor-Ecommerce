// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/authentication/widgets/forget_password.dart';
import 'package:food_ecommerce/screens/authentication/widgets/login_screen.dart';
import 'package:food_ecommerce/screens/authentication/widgets/signup.dart';
import 'package:provider/provider.dart';

class AuthenticatedAnimatedDialog extends StatefulWidget {
  const AuthenticatedAnimatedDialog({super.key});

  @override
  _AuthenticatedAnimatedDialogState createState() =>
      _AuthenticatedAnimatedDialogState();
}

class _AuthenticatedAnimatedDialogState
    extends State<AuthenticatedAnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FoodEcommerceProvider>(context);
    getheight(String val) {
      switch (val) {
        case 'Login':
          return 690.0;
        case 'ForgetPassword':
          return 480.0;
        case 'signup':
          return 850.0;
      }
    }

    return ScaleTransition(
        scale: _scaleAnimation,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 700,
            height: getheight(controller.selectedShowDialog),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Builder(builder: (context) {
                  getscreens(String val) {
                    switch (val) {
                      case 'Login':
                        return const LoginWidget();
                      case 'ForgetPassword':
                        return const ForgetPassword();
                      case 'signup':
                        return const SignUpWidget();
                    }
                  }

                  return Scaffold(
                      body: getscreens(controller.selectedShowDialog));
                })),
          ),
        ));
  }
}
