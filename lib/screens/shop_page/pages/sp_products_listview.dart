import 'package:flutter/material.dart';

import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/product_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:food_ecommerce/screens/shop_page/pages/add_modifiers_dialog.dart';
import 'package:provider/provider.dart';

class FoodItemsListView extends StatelessWidget {
  const FoodItemsListView({super.key, required this.data});
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    var mainController = Provider.of<FoodEcommerceProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: const Color(0xffFFF7DD),
                child: Center(
                  child: Image.asset('images/mi-4.png'),
                ),
              ),
            ),
            Expanded(
                child: ListTile(
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 0, top: 0),
                child: Text(
                  '    data.description,',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.headingTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              title: Text(
                '£${data.selling_price.toString()}   x   ${data.name}',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: AppColors.headingTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            MaterialButton(
              onPressed: () {
                mainController
                    .getModifiersGroupProducts(data.uuid.toString())
                    .then((value) {
                  if (value.isEmpty) {
                    mainController.addProductToCart(
                        context: context,
                        taxtype: 'Included',
                        productname: data.name.toString(),
                        modifiersSelected: desktopselectedItemsList,
                        productUUid: data.uuid.toString(),
                        singlePrice: data.selling_price!,
                        tax: data.selling_price!,
                        quantity: 1);
                  } else {
                    showAnimatedDialogModifers(context, value, data);
                  }
                });
              },
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.primaryColor),
                child: const Center(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
