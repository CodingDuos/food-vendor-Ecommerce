import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/product_model.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';

import 'package:food_ecommerce/screens/shop_page/pages/sp_products_grid.dart';
import 'package:food_ecommerce/screens/shop_page/pages/sp_products_listview.dart';
import 'package:provider/provider.dart';

Widget buildCategoryListView(
    String category, BuildContext context, List<ProductModel> productData) {
  final controller = Provider.of<FoodEcommerceProvider>(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 28,
            color: AppColors.headingTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      LayoutBuilder(builder: (context, constraints) {
        return controller.isgridview
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: productData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount:
                        calculateCrossAxisCount(context, constraints.maxWidth)),
                itemBuilder: (context, index) {
                  return FoodItemsGrid(data: productData[index]);
                })
            : ListView.builder(
                shrinkWrap: true,
                itemCount: productData.length,
                itemBuilder: (context, index) {
                  return FoodItemsListView(data: productData[index]);
                });
      })
    ],
  );
}

int calculateCrossAxisCount(BuildContext context, double screenWidth) {
  double itemWidth = 350.0;
  int crossAxisCount = (screenWidth / itemWidth).floor();
  return crossAxisCount < 1 ? 1 : crossAxisCount;
}
