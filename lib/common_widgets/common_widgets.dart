// ignore_for_file: unused_field, library_private_types_in_public_api, avoid_print,

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/models/product_model.dart';
import 'package:food_ecommerce/services/fetch_supabase.dart';

class OneTimeFutureBuilder<T> extends StatefulWidget {
  final Future<T> Function() futureFunction;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot)
      builder;

  const OneTimeFutureBuilder({
    required this.futureFunction,
    required this.builder,
    super.key,
  });

  @override
  _OneTimeFutureBuilderState<T> createState() =>
      _OneTimeFutureBuilderState<T>();
}

class _OneTimeFutureBuilderState<T> extends State<OneTimeFutureBuilder<T>>
    with AutomaticKeepAliveClientMixin {
  late Future<T> _future;
  late T _data;

  @override
  void initState() {
    super.initState();
    _future = widget.futureFunction();
  }

  // Function to manually update the future
  Future<void> updateFuture() async {
    setState(() {
      _future = widget.futureFunction();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // To keep the state alive

    return FutureBuilder<T>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            _data = snapshot.data as T;
            return widget.builder(context, snapshot);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
        }
        return const SizedBox();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

//

class CustomFutureBuilder extends StatefulWidget {
  final String uuid;
  final bool isLoadingIndex;
  final displayLevelUUId;
  final Widget Function(BuildContext context, List<ProductModel> productList)
      builder;
  const CustomFutureBuilder(
      {super.key,
      required this.uuid,
      required this.builder,
      required this.displayLevelUUId,
      required this.isLoadingIndex});

  @override
  State<CustomFutureBuilder> createState() => _CustomFutureBuilderState();
}

class _CustomFutureBuilderState extends State<CustomFutureBuilder> {
  List<ProductModel> productList = [];
  bool isLoading = false;
  Timer? _tIMER;
  fetchProducts() async {
    _tIMER = Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        final response = await supbaseClient.rpc('get_display_level_products',
            params: {
              'categoryuuid': widget.uuid,
              'displayleveluuid': widget.displayLevelUUId
            });

        List<ProductModel> newProductList = [];
        if (response != null) {
          newProductList =
              (response as List).map((e) => ProductModel.fromMap(e)).toList();
          newProductList
              .sort((a, b) => a.selling_price!.compareTo(b.selling_price!));
        }
        if (!listsAreEqual(newProductList, productList) || !isLoading) {
          if (mounted) {
            setState(() {
              productList = newProductList;
              isLoading = true;
            });
          }
        }
      } catch (e) {
        print("Error fetching products: $e");
        if (mounted) {
          setState(() {
            productList = [];
            isLoading = true;
          });
        }
      }
    });
  }

  bool listsAreEqual(List<ProductModel> list1, List<ProductModel> list2) {
    if (list1.length != list2.length) {
      return false;
    }
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    _tIMER!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == false) {
      if (widget.isLoadingIndex == true) {
        return Center(
          child: SpinKitThreeBounce(
            color: AppColors.primaryColor,
            size: 50.0,
          ),
        );
      } else {
        return Container();
      }
    }
    return widget.builder(context, productList);
  }
}
