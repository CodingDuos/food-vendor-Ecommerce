import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/providers/authentication_repository.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/authentication/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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
        const Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 5, bottom: 10),
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
                      height: 45,
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
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Image.asset('images/fb.png', height: 30),
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
        const Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OR CREATE ACCOUNT',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 14),
              ),
            ],
          ),
        ),
        TextFieldWidget(
          hintText: 'First Name',
          controller: firstNameController,
        ),
        TextFieldWidget(
          hintText: 'First Name',
          controller: lastNameController,
        ),
        TextFieldWidget(
          hintText: 'Phone',
          controller: phoneNumberController,
        ),
        TextFieldWidget(
          hintText: 'Email',
          controller: emailController,
        ),
        TextFieldWidget(
          hintText: 'Password',
          controller: passwordController,
        ),
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
                  passwordController.text.isEmpty ||
                  phoneNumberController.text.isEmpty ||
                  firstNameController.text.isEmpty ||
                  lastNameController.text.isEmpty) {
                controller.setAuthenticationError('Please fill all fields');
              } else {
                controller.setAuthenticationError('');
                controller.setAuthenticationLoading(true);

                await AuthenticationRepository.signUpCustomer(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    phone: phoneNumberController.text,
                    context: context,
                    email: emailController.text,
                    password: passwordController.text);

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
                          'Create Account',
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
        const Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 10),
          child: Text(
            'You must be at least 18 years old to sign up for Purple Garden. By signing up you agree to the Privacy Policy and Terms of Service',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
            onPressed: () async {
              controller.setAuthenticationError('');
              controller.setselectedShowDialog('Login');
            },
            child: Text(
              'Already have an account?',
              style: TextStyle(
                  color: AppColors.headingTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            )),
      ],
    );
  }
}
