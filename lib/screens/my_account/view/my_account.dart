import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class MyaccountViewScreen extends StatefulWidget {
  const MyaccountViewScreen({super.key, this.storeID});
  final String? storeID;

  @override
  State<MyaccountViewScreen> createState() => _MyaccountViewScreenState();
}

class _MyaccountViewScreenState extends State<MyaccountViewScreen> {
  @override
  void initState() {
    fetchstoreId();
    super.initState();
  }

  fetchstoreId() async {
    final controller =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    await controller.fetchDataFromSupabase('stores', context);
    await controller.setstoreId(widget.storeID.toString());
    await controller.setLoading(true);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FoodEcommerceProvider>(context);
    return Scaffold(
      body: controller.isLoadingAllCheckedConditions == false
          ? Center(
              child: SpinKitThreeBounce(
                color: AppColors.primaryColor,
                size: 50.0,
              ),
            )
          : const MyAccountViewBodyScreen(),
    );
  }
}

class MyAccountViewBodyScreen extends StatelessWidget {
  const MyAccountViewBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<FoodEcommerceProvider>(context, listen: false);
    return ListView(children: [
      // const HeaderViewPageBody(),
      ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: controller.geShopPagesScreens.length,
          itemBuilder: (context, index) {
            return controller.geMyAccountPagesScreens[index];
          })
    ]);
  }
}
