// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/authentication/authentication_view.dart';
import 'package:food_ecommerce/services/responsive.dart';
import 'package:provider/provider.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';

class HeaderViewPageBody extends StatefulWidget {
  const HeaderViewPageBody({super.key});

  @override
  State<HeaderViewPageBody> createState() => _HeaderViewPageBodyState();
}

class _HeaderViewPageBodyState extends State<HeaderViewPageBody> {
  bool showdialog = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Provider.of<FoodEcommerceProvider>(context);
    return SizedBox(
      height: size.height * 0.17,
      child: Column(
        children: [
          Expanded(
              child: SizedBox(
            child: Padding(
              padding: Responsive.getResponsivePadding(context),
              child: Row(
                children: [
                  Image.asset(
                    'images/logo.png',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MediaQuery.of(context).size.width < 1000
                      ? Container()
                      : Row(
                          children: [
                            'Home',
                            'Menu',
                            'Contact',
                            'My Account',
                          ]
                              .map((e) => HomeTitlesWidget(selectedPageName: e))
                              .toList(),
                        ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 35,
                          )),
                      const Text(
                        'WishList',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            final controller =
                                Provider.of<FoodEcommerceProvider>(context,
                                    listen: false);
                            controller.setselectedTab('My Cart');
                          },
                          icon: Icon(
                            Icons.shopping_basket_outlined,
                            color: Provider.of<FoodEcommerceProvider>(context,
                                            listen: false)
                                        .selectedTab ==
                                    'My Cart'
                                ? AppColors.fOODColor
                                : Colors.white,
                            size: 35,
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Cart',
                            style: TextStyle(
                                color: Provider.of<FoodEcommerceProvider>(
                                                context,
                                                listen: false)
                                            .selectedTab ==
                                        'My Cart'
                                    ? AppColors.fOODColor
                                    : Colors.white),
                          ),
                          Text(
                            '£${Provider.of<FoodEcommerceProvider>(context).cartListItems.fold(0.0, (previousValue, element) => previousValue).toStringAsFixed(2)}',
                            style: TextStyle(color: AppColors.fOODColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  )),
                  controller.currentUser == null
                      ? MaterialButton(
                          onPressed: () {
                            _showAnimatedDialog(context);
                          },
                          child: Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.primaryColor),
                            child: const Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        )
                      : QudsPopupButton(
                          items: getMenuItems(),
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'images/profile.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                controller.currentUser!.email.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              const Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  void _showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AuthenticatedAnimatedDialog();
      },
    ).then((value) {
      final controller =
          Provider.of<FoodEcommerceProvider>(context, listen: false);
      controller.setselectedShowDialog('Login');
    });
  }
}

class HomeTitlesWidget extends StatefulWidget {
  const HomeTitlesWidget({super.key, required this.selectedPageName});
  final String selectedPageName;

  @override
  State<HomeTitlesWidget> createState() => _HomeTitlesWidgetState();
}

class _HomeTitlesWidgetState extends State<HomeTitlesWidget> {
  bool ishovering = false;

  @override
  Widget build(BuildContext context) {
    String textToMeasure = widget.selectedPageName;

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: textToMeasure,
        style: const TextStyle(fontSize: 18),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    double textWidth = textPainter.width;
    return InkWell(
      onTap: () {
        final controller =
            Provider.of<FoodEcommerceProvider>(context, listen: false);
        controller.setselectedTab(widget.selectedPageName);

        navigateNewScreen(context, widget.selectedPageName);
      },
      onHover: (val) {
        ishovering = val;
        setState(() {});
      },
      child: SizedBox(
        width: 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.selectedPageName,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: widget.selectedPageName ==
                          Provider.of<FoodEcommerceProvider>(context,
                                  listen: false)
                              .selectedTab
                      ? AppColors.fOODColor
                      : AppColors.whitecolor,
                  fontSize: 18,
                  fontWeight: widget.selectedPageName ==
                          Provider.of<FoodEcommerceProvider>(context,
                                  listen: false)
                              .selectedTab
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2, top: 4),
                child: AnimatedContainer(
                  curve: Curves.bounceIn,
                  duration: const Duration(milliseconds: 600),
                  color: widget.selectedPageName ==
                          Provider.of<FoodEcommerceProvider>(context,
                                  listen: false)
                              .selectedTab
                      ? AppColors.fOODColor
                      : AppColors.primaryColor,
                  height: 4,
                  width: ishovering ? textWidth : 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<QudsPopupMenuBase> getMenuItems() {
  return [
    QudsPopupMenuItem(
        leading: const Icon(Icons.person_pin_outlined),
        title: const Text('My Account'),
        onPressed: () {}),
    QudsPopupMenuItem(
        leading: const Icon(Icons.shopping_cart_outlined),
        title: const Text('My Orders'),
        onPressed: () {}),
    QudsPopupMenuItem(
        leading: const Icon(Icons.favorite_border_outlined),
        title: const Text('My Wishlist'),
        onPressed: () {}),
    QudsPopupMenuItem(
        leading: const Icon(Icons.home_repair_service_outlined),
        title: const Text('My Address'),
        onPressed: () {}),
    QudsPopupMenuItem(
        leading: const Icon(Icons.logout_rounded),
        title: const Text('Logout'),
        onPressed: () {}),
  ];
}
