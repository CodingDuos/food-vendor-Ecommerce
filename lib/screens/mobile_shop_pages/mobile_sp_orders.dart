import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_ecommerce/common_widgets/textpaymentwidget.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/models/cart_product_model.dart';
import 'package:food_ecommerce/models/cart_product_modifier_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/authentication/authentication_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MobileYourOrder extends StatefulWidget {
  const MobileYourOrder({super.key});

  @override
  State<MobileYourOrder> createState() => _YourOrderState();
}

class _YourOrderState extends State<MobileYourOrder> {
  String selectedTab = '';

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<FoodEcommerceProvider>(context);
    CartModel cartItems = mainController.cartListItems.first;
    return buildOrderDetails(cartItems);
  }

  Widget buildOrderDetails(var cartItems) {
    final mainController = Provider.of<FoodEcommerceProvider>(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildOrderHeader(),
          mainController.cartListItems.first.product!.isEmpty
              ? const SizedBox(
                  height: 500,
                  child: Center(
                    child: Text('No Item Added to Cart - Cart List is Empty'),
                  ),
                )
              : Column(
                  children: [
                    buildDeliveryPickupToggle(),
                    buildCartItems(cartItems),
                    buildPromoCodeSection(),
                    buildPaymentDetails(),
                    buildOrderCheckoutButton(),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildOrderHeader() {
    return Container(
      width: double.infinity,
      height: 75,
      color: AppColors.headingTextColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Text(
          'Order Summary',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: AppColors.whitecolor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildDeliveryPickupToggle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildToggleButtons(),
        ),
      ),
    );
  }

  Widget buildToggleButtons() {
    final mainController = Provider.of<FoodEcommerceProvider>(context);
    return Column(
      children: [
        Row(
          children: mainController.servicesList.map((e) {
            bool isSelected = e.name == selectedTab;
            return Expanded(
              child: InkWell(
                onTap: () {
                  selectedTab = e.name.toString();
                  mainController.setselectedServiceType(e.name.toString());
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 75,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.headingTextColor
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:
                      buildToggleButtonContent(e.name.toString(), isSelected),
                ),
              ),
            );
          }).toList(),
        ),
        mainController.selectedServiceError.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  mainController.selectedServiceError,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
      ],
    );
  }

  Widget buildToggleButtonContent(String label, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.headingTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'in 15 minutes',
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.headingTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget buildCartItems(var cartItems) {
    return cartItems.product!.isEmpty
        ? const SizedBox(
            height: 400,
            child: Center(
              child: Text('No Item Added to Cart'),
            ),
          )
        : buildCartListView(cartItems);
  }

  Widget buildCartListView(var cartItems) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cartItems.product!.length,
      itemBuilder: (context, index) {
        return buildCartItem(cartItems.product![index], index);
      },
    );
  }

  Widget buildCartItem(CartProductModel productData, int index) {
    final mainController = Provider.of<FoodEcommerceProvider>(context);

    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? 0 : 10, left: 10, right: 10),
      child: DottedBorder(
        color: AppColors.headingTextColor,
        strokeWidth: 0.2,
        child: Column(
          children: [
            buildProductDetails(productData, mainController),
            SizedBox(height: productData.modifiers.isEmpty ? 0 : 10),
            buildModifiersList(productData),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildProductDetails(CartProductModel productData, var mainController) {
    return Row(
      children: [
        buildProductImage(),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${productData.title} ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ),
        buildQuantityControls(productData, mainController),
        const SizedBox(width: 10),
        buildDeleteButton(productData),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: const Color(0xffFFF7DD),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Image.asset(
              'images/mi-4.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuantityControls(
      CartProductModel productData, FoodEcommerceProvider mainController) {
    return Row(
      children: [
        buildQuantityButton(Icons.remove, () {
          mainController.updatingProductQuantity(productData, false, context);
        }),
        const SizedBox(width: 5),
        Text(
          productData.qty.toString(),
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(
          'x ${productData.singlePrice.toString()}',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 5),
        buildQuantityButton(Icons.add, () {
          mainController.updatingProductQuantity(productData, true, context);
        }),
      ],
    );
  }

  Widget buildQuantityButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Center(
          child: Icon(icon, color: AppColors.primaryColor),
        ),
      ),
    );
  }

  Widget buildDeleteButton(CartProductModel productData) {
    final mainController =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    CartModel cartItems = mainController.cartListItems.first;
    var excitingItems = cartItems.product!
        .firstWhere((element) => element.uuid == productData.uuid);
    return SizedBox(
      width: 30,
      child: IconButton(
        onPressed: () {
          cartItems.product!.remove(excitingItems);
        },
        icon: Icon(
          Icons.delete,
          color: AppColors.headingTextColor,
          size: 25,
        ),
      ),
    );
  }

  Widget buildModifiersList(CartProductModel productData) {
    return Builder(
      builder: (context) {
        productData.modifiers.sort(
            (a, b) => a.modifiersGroupName!.compareTo(b.modifiersGroupName!));

        return Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: ListView.builder(
            itemCount: productData.modifiers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              CartProductModifier modifiers = productData.modifiers[index];
              return buildModifierItem(productData, modifiers);
            },
          ),
        );
      },
    );
  }

  Widget buildModifierItem(
      CartProductModel productData, CartProductModifier modifiers) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 40),
                    Text(modifiers.title.toString()),
                    Text(' (£${modifiers.totalPrice})'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildQuantityButton(Icons.remove, () {
                      subtractModifiersQunatity(productData, modifiers);
                    }),
                    const SizedBox(width: 5),
                    Text('${modifiers.qty} X'),
                    const SizedBox(width: 5),
                    buildQuantityButton(Icons.add, () {
                      addModifiersQunatity(productData.uuid, modifiers);
                    }),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPromoCodeSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30)),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Additional Restaurant Notes',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Icon(Icons.edit, color: Colors.black54)
          ],
        ),
      ),
    );
  }

  Widget buildPaymentDetails() {
    final mainController = Provider.of<FoodEcommerceProvider>(context);
    return Column(
      children: [
        TextPaymentwidget(
            title: 'Subtotal',
            value: mainController.cartListItems.first.totalamount!
                .toStringAsFixed(2)),
        TextPaymentwidget(
            title: 'Order Total',
            value: mainController.cartListItems.first.totalamount!
                .toStringAsFixed(2)),
      ],
    );
  }

  Widget buildOrderCheckoutButton() {
    final mainController = Provider.of<FoodEcommerceProvider>(context);
    return mainController.cartListItems.first.product!.isEmpty
        ? Container(
            height: 100,
          )
        : Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
            child: MaterialButton(
              onPressed: () {
                mainController.setselectedServiceError('');
                if (mainController.selectedserviceType.isEmpty) {
                  mainController
                      .setselectedServiceError('Please Select Service Type');
                } else {
                  if (mainController.currentUser == null) {
                    showAnimatedDialog(context);
                  } else {
                    mainController.setselectedTab('My Cart');
                    context.go('/${mainController.storeId}/my-cart');
                  }
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.headingTextColor),
                child: const Center(
                  child: Text(
                    'Order Checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                ),
              ),
            ),
          );
  }

  void showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AuthenticatedAnimatedDialog();
      },
    ).then((value) {});
  }

  subtractModifiersQunatity(var productData, var modifiers) {
    final mainController =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    CartModel cartItems = mainController.cartListItems.first;
    final productMatches =
        cartItems.product?.where((element) => element.uuid == productData.uuid);

    if (productMatches != null && productMatches.isNotEmpty) {
      final product = productMatches.first;
      final matchingModifiers = product.modifiers;
      final matchingModifierIndex =
          matchingModifiers.indexWhere((element) => element == modifiers);

      if (matchingModifierIndex != -1) {
        matchingModifiers[matchingModifierIndex].qty =
            (matchingModifiers[matchingModifierIndex].qty ?? 0) - 1;

        if (matchingModifiers[matchingModifierIndex].qty == 0) {
          matchingModifiers.removeAt(matchingModifierIndex);
        }
      }
    }
    mainController.updateTotalAmount(context);

    mainController.refresh();
  }

  addModifiersQunatity(var productData, var modifiers) {
    final mainController =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    CartModel cartItems = mainController.cartListItems.first;
    final productMatches =
        cartItems.product?.where((element) => element.uuid == productData);

    if (productMatches != null && productMatches.isNotEmpty) {
      final product = productMatches.first;
      final matchingModifier = product.modifiers.firstWhere(
        (element) => element == modifiers,
      );

      matchingModifier.qty = (matchingModifier.qty ?? 0) + 1;
    }

    mainController.updateTotalAmount(context);

    mainController.refresh();
  }
}
