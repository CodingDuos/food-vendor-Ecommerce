// ignore_for_file: avoid_print, unused_local_variable

import 'package:food_ecommerce/dashboard/view/dashboard_view.dart';
import 'package:food_ecommerce/screens/my_cart/view/my_cart_view.dart';
import 'package:food_ecommerce/screens/shop_page/view/shop_page_view.dart';
import 'package:go_router/go_router.dart';
import '../screens/store_nofound/nofound_store.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const StoreNoFound();
      },
    ),
    GoRoute(
      path: '/:storeid/shop-page',
      builder: (context, state) {
        final storeid = state.pathParameters['storeid']!;
        return ShopPageViewScreen(
          storeId: storeid,
        );
      },
    ),
    GoRoute(
      path: '/:storeid/home',
      builder: (context, state) {
        final storeid = state.pathParameters['storeid']!;
        return DashBoardViewScreen(
          storeId: storeid,
        );
      },
    ),
    GoRoute(
      path: '/:storeid/my-cart',
      builder: (context, state) {
        final storeid = state.pathParameters['storeid']!;
        return MycartViewScreen(storeId: storeid);
      },
    ),
  ],
);
