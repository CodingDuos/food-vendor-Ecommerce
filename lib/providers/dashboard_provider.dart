// ignore_for_file: use_build_context_synchronously, avoid_print, depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/models/cart_product_model.dart';
import 'package:food_ecommerce/models/cart_product_modifier_model.dart';
import 'package:food_ecommerce/models/country_model.dart';
import 'package:food_ecommerce/models/customer_model.dart';
import 'package:food_ecommerce/models/display_level_categories_model.dart';
import 'package:food_ecommerce/models/display_level_model.dart';
import 'package:food_ecommerce/models/location_model.dart';
import 'package:food_ecommerce/models/modifier_display_level_group.dart';
import 'package:food_ecommerce/models/mofiers_model.dart';
import 'package:food_ecommerce/models/product_model.dart';
import 'package:food_ecommerce/models/services_model.dart';
import 'package:food_ecommerce/models/store_model.dart';
import 'package:food_ecommerce/screens/footer_page/mobile_footer.dart';
import 'package:food_ecommerce/screens/homepage/all_foods/all_foods.dart';
import 'package:food_ecommerce/screens/homepage/applications/applications.dart';
import 'package:food_ecommerce/screens/homepage/deal/deal.dart';
import 'package:food_ecommerce/screens/homepage/deal2/deal2.dart';
import 'package:food_ecommerce/screens/homepage/grocery/grocery.dart';
import 'package:food_ecommerce/screens/homepage/homepage_main/homepage_main.dart';
import 'package:food_ecommerce/screens/homepage/menu/menu_page.dart';
import 'package:food_ecommerce/screens/homepage/offers/offers.dart';
import 'package:food_ecommerce/screens/homepage/popular_dishes/popular_dishes.dart';
import 'package:food_ecommerce/screens/homepage/services/services.dart';
import 'package:food_ecommerce/screens/homepage/tooltips/tooltip.dart';
import 'package:food_ecommerce/screens/mobile_homepage/mobile_all_foods/mobile_all_foods.dart';
import 'package:food_ecommerce/screens/mobile_homepage/mobile_applications/mobile_applications.dart';
import 'package:food_ecommerce/screens/mobile_homepage/mobile_deal/mobile_deal.dart';
import 'package:food_ecommerce/screens/mobile_homepage/mobile_homepage_main/mobile_homepage_main.dart';
import 'package:food_ecommerce/screens/mobile_homepage/mobile_menu/mobile_menu_page.dart';
import 'package:food_ecommerce/screens/mobile_homepage/mobile_offers/mobile_offers.dart';
import 'package:food_ecommerce/screens/mobile_homepage/mobile_popular_dishes/mobile_popular_dishes.dart';
import 'package:food_ecommerce/screens/mobile_homepage/mobile_tooltips/mobile_tooltip.dart';
import 'package:food_ecommerce/screens/mobile_shop_pages/mobile_sp_body.dart';
import 'package:food_ecommerce/screens/mobile_shop_pages/mobile_sp_main.dart';
import 'package:food_ecommerce/screens/my_account/pages/ma_body.dart';
import 'package:food_ecommerce/screens/my_account/pages/ma_main.dart';
import 'package:food_ecommerce/screens/my_cart/pages/mc_body.dart';
import 'package:food_ecommerce/screens/my_cart/pages/mc_main.dart';
import 'package:food_ecommerce/screens/shop_page/pages/sp_body.dart';
import 'package:food_ecommerce/screens/shop_page/pages/sp_main.dart';
import 'package:food_ecommerce/services/fetch_supabase.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class FoodEcommerceProvider with ChangeNotifier {
  bool addToCartisLoading = false;
  String addToCartId = '';
  bool isLoadingAllCheckedConditions = false;
  ScrollController listviewController = ScrollController();
  ScrollController shopPagelistviewController = ScrollController();
  ScrollController homePagelistviewController = ScrollController();
  List<CustomerModel> excitedAllUsers = [];
  String selectedCategory = 'All';
  String selectedCategoryUUID = '';
  String selectedSubCategory = '';
  String selectedSubCategoryUUID = '';
  CustomerModel? currentUser;
  bool autenticationLoading = false;
  String authenticationError = '';
  List<ServicesTypeModel> servicesList = [];
  String selectedShowDialog = 'Login';
  String selectedserviceType = '';
  String selectedServiceError = '';
  CountryModel? countryCurrent;
  bool isLogin = false;
  List<StoreModel> storeList = [];
  StoreModel? currentStore;
  List<LocationModel> locationList = [];
  List<DisplayLevelModel> displaylevel = [];
  DisplayLevelModel? currentDisplayLevel;
  LocationModel? currentLocation;
  List<DisplayLevelCategoriesModel> categories = [];
  String storeId = '';
  String productId = '';
  String selectedTab = '';
  List<DisplayLevelCategoriesModel> subCategoriesList = [];
  TextEditingController searchController = TextEditingController();
  List<CartModel> cartListItems = [];
  String currentCartUuid = '';
  bool isgridview = true;

  setLoadingAddToCart(bool val, String id) {
    addToCartisLoading = val;
    addToCartId = id;
    notifyListeners();
  }

  setisgridview(bool val) {
    isgridview = val;
    notifyListeners();
  }

  setselectedServiceError(String val) {
    selectedServiceError = val;
    notifyListeners();
  }

  setselectedServiceType(String val) {
    selectedserviceType = val;
    selectedServiceError = '';
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }

  setAuthenticationError(String val) {
    authenticationError = val;
    refresh();
  }

  setAuthenticationLoading(bool val) {
    autenticationLoading = val;
    refresh();
  }

  setAuthentication(CustomerModel val) {
    currentUser = val;
    refresh();
  }

  setSelectedSubCategory(String val, uuid) {
    selectedSubCategory = val;
    selectedSubCategoryUUID = uuid;
    refresh();
  }

  setSelectedCategory(String val, uuid) {
    selectedCategory = val;
    selectedCategoryUUID = uuid;
    refresh();
  }

  setselectedShowDialog(String val) {
    selectedShowDialog = val;
    refresh();
  }

  setLogin(bool val) {
    isLogin = val;
    refresh();
  }

  setstoreId(String val) {
    storeId = val;
  }

  setLoading(bool val) {
    isLoadingAllCheckedConditions = val;
    refresh();
  }

  setcurrentstoreNull() {
    currentStore = null;
    refresh();
  }

  setselectedTab(String val) {
    selectedTab = val;
    isLoadingAllCheckedConditions = false;
    refresh();
  }

  fetchDataFromSupabase(String tableName, BuildContext context) async {
    try {
      switch (tableName) {
        case 'stores':
          storeList = await FetchSupabaseRepository.fetchsupaBaseTablesDataLink<
              StoreModel>(tableName, fromJson: StoreModel.fromJson);
          if (storeList.isNotEmpty) {
            var storesdata =
                storeList.where((element) => element.uuid == storeId);
            if (storesdata.isNotEmpty) {
              currentStore = storesdata.first;
              await fetchDataFromSupabase('locations', context);
              await fetchDataFromSupabase('display_levels_categories', context);
            } else {
              return false;
            }
          } else {
            currentStore = null;
            context.go('/');
          }
          break;
        case 'locations':
          locationList = await FetchSupabaseRepository
              .fetchsupaBaseTablesDataLink<LocationModel>(
            tableName,
            fromJson: LocationModel.fromMap,
          );
          currentLocation = locationList
              .firstWhere((element) => element.id == currentStore!.locationId);
          break;
        case 'countries':
          List<CountryModel> countryData = await FetchSupabaseRepository
              .fetchsupaBaseTablesDataLink<CountryModel>(
            tableName,
            fromJson: CountryModel.fromJson,
          );
          if (countryData.isNotEmpty) {
            countryCurrent = countryData.firstWhere(
                (element) => element.id == currentLocation!.countryId);
          }
          break;
        case 'customers':
          excitedAllUsers = await FetchSupabaseRepository
              .fetchsupaBaseTablesDataLink<CustomerModel>(
            tableName,
            fromJson: CustomerModel.fromMap,
          );

          break;
        case 'services':
          List<ServicesTypeModel> serviceData = await FetchSupabaseRepository
              .fetchsupaBaseTablesDataLink<ServicesTypeModel>(
            tableName,
            fromJson: ServicesTypeModel.fromMap,
          );
          servicesList = serviceData
              .where((element) => element.locationId == currentLocation!.id)
              .toList();
          break;
        case 'display_levels_categories':
          List<DisplayLevelModel> displayLevelModel =
              await FetchSupabaseRepository.fetchsupaBaseTablesDataLink<
                      DisplayLevelModel>('display_levels',
                  fromJson: DisplayLevelModel.fromMap);
          if (displayLevelModel.isNotEmpty) {
            currentDisplayLevel = displayLevelModel.firstWhere(
                (element) => element.locationId == currentLocation!.id,
                orElse: () => DisplayLevelModel());
            if (currentDisplayLevel!.uuid.toString() != 'null') {
              categories = await fetchDisplayLevelCategories();
            }
          }
          break;
      }
      refresh();
    } catch (e) {
      print(e);
    }
  }

  Future<List<DisplayLevelCategoriesModel>>
      fetchDisplayLevelCategories() async {
    try {
      if (currentDisplayLevel != null) {
        final response = await supbaseClient.rpc(
            'get_parent_categories_by_display_level',
            params: {'display_level_uuid1': currentDisplayLevel!.uuid});

        List<DisplayLevelCategoriesModel> data = (response as List)
            .map((e) => DisplayLevelCategoriesModel.fromJson(e))
            .toList();
        return data;
      }

      return [];
    } catch (e) {
      print('error when fetching display level categories:$e');
      return [];
    }
  }

  Future<List<DisplayLevelCategoriesModel>> fetchSubCategoriesList(
      String categoryUUID) async {
    try {
      final response = await supbaseClient
          .rpc('get_sub_categories_by_display_level', params: {
        'displayleveluuid': currentDisplayLevel!.uuid.toString(),
        'categoryuuid': categoryUUID
      });
      List<DisplayLevelCategoriesModel> data = (response as List)
          .map((e) => DisplayLevelCategoriesModel.fromJson(e))
          .toList();
      return data;
    } catch (e) {
      print('error when fetching sub categories list:$e');
    }
    return [];
  }

  Future<List<ProductModel>> getDisplayLevelProducts(
      String categoryUUID) async {
    try {
      print('dddddddddddddd');
      final response =
          await supbaseClient.rpc('get_display_level_products', params: {
        'categoryUuid': categoryUUID,
        'displayLevelUuid': currentDisplayLevel!.uuid.toString()
      });

      print(response);
      List<ProductModel> data =
          (response as List).map((e) => ProductModel.fromMap(e)).toList();

      return data;
    } catch (e) {
      print('error when fetching products list:$e');
    }
    return [];
  }

  getDisplayLevelProducts1(String categoryUUID) async {
    try {
      final response =
          await supbaseClient.rpc('get_display_level_products', params: {
        'categoryuuid': categoryUUID,
        'displayleveluuid': currentDisplayLevel!.uuid.toString()
      });

      List<ProductModel> data =
          (response as List).map((e) => ProductModel.fromMap(e)).toList();

      return data;
    } catch (e) {
      print('error when fetching products list:$e');
    }
    return [];
  }

  searchProductOfModifiers() async {
    try {
      final response =
          await supbaseClient.rpc('search_display_products', params: {
        'text_input': searchController.text,
        'uuid_input': currentDisplayLevel!.uuid.toString()
      });
      print(response);
      List<ProductModel> data =
          (response as List).map((e) => ProductModel.fromMap(e)).toList();
      print(data.length);
      return data;
    } catch (e) {
      print('error when fetching products list:$e');
    }
    return [];
  }

  Future<List<ModifiersDisplayLevelModelGroup>> getModifiersGroupProducts(
      String productUUid) async {
    try {
      final response = await supbaseClient.rpc(
          'get_display_level_modifier_groups',
          params: {'productuuid': productUUid});

      List<ModifiersDisplayLevelModelGroup> data = (response as List)
          .map((e) => ModifiersDisplayLevelModelGroup.fromMap(e))
          .toList();
      return data;
    } catch (e) {
      print('error when group modifiers list:$e');
    }
    return [];
  }

  Future<List<ModifiersModel>> getModifiersofGroupAndProducts(
      String groupId, String productUUid) async {
    try {
      final response = await supbaseClient.rpc('get_display_level_modifiers',
          params: {
            'modifierdisplayleveluuid': groupId,
            'locationproductuuid': productUUid
          });

      print(response);

      List<ModifiersModel> data =
          (response as List).map((e) => ModifiersModel.fromMap(e)).toList();
      return data;
    } catch (e) {
      print('error when fetching products list:$e');
    }
    return [];
  }
  //

  addItemsToCartList() {
    if (currentCartUuid.isEmpty) {
      currentCartUuid = const Uuid().v4().toString();
      cartListItems.add(CartModel(
          transaction_uuid: const Uuid().v4().toString(),
          uuid: currentCartUuid,
          product: [],
          orderStatusId: 2,
          orderNumber: '#ORDER${generateRandomTenDigitNumber().toString()}',
          order_ticket_status_id: 1,
          sale_channel_id: 2,
          totalamount: 0,
          customer_id: currentUser != null ? currentUser!.uuid : '',
          location_id: currentLocation!.id,
          service_id: 1));
    }
    notifyListeners();
  }

  int generateRandomTenDigitNumber() {
    Random random = Random();
    int result = 0;

    for (int i = 0; i < 10; i++) {
      int digit = random.nextInt(10);
      result = result * 10 + digit;
    }

    return result;
  }

  Future addProductToCart(
      {required List<SelectedItem> modifiersSelected,
      required String productUUid,
      required BuildContext context,
      required String productname,
      required num singlePrice,
      required String taxtype,
      required num tax,
      required int quantity}) async {
    if (cartListItems.isNotEmpty) {
      List<CartProductModifier> modifiers = [];
      for (var element in modifiersSelected) {
        modifiers.add(CartProductModifier(
          id: element.selectedItem.id,
          title: element.selectedItem.name,
          singlePrice: element.selectedItem.sale_price,
          qty: element.selectedItem.quantity,
          localId: 1,
          uuid: element.selectedItem.uuid.toString(),
          modifiersGroupName: element.parentGroupName,
          modifiersGroupUUid: element.groupuuid,
          productUuid: productUUid,
          tax: double.parse(element.selectedItem.tax.toString()),
        ));
      }

      bool newProduct = cartListItems.first.product!
          .where((element) => element.uuid == productUUid)
          .toList()
          .isEmpty;
      if (newProduct) {
        cartListItems.first.product!.add(CartProductModel(
            departmentUuid: '',
            categoryUuid: '',
            brandUuid: ' ',
            localId: 2,
            productTypeId: 1,
            weight: 0,
            groupUuid: '',
            uuid: productUUid,
            modifiers: modifiers,
            title: productname,
            singlePrice: singlePrice,
            taxType: taxtype,
            qty: quantity,
            tax: tax));
      } else {
        var excitingItems = cartListItems.first.product!
            .where((element) => element.uuid == productUUid);
        if (excitingItems.length == 1) {
          if (modifiersListMatches(excitingItems.first.modifiers, modifiers) ==
              false) {
            cartListItems.first.product!.add(CartProductModel(
                departmentUuid: '',
                categoryUuid: '',
                brandUuid: ' ',
                localId: 2,
                productTypeId: 1,
                weight: 0,
                groupUuid: '',
                uuid: productUUid,
                modifiers: modifiers,
                title: productname,
                singlePrice: singlePrice,
                taxType: taxtype,
                qty: quantity,
                tax: tax));
          } else {
            excitingItems.first.qty = excitingItems.first.qty! + 1;
          }
        } else {
          var isFound = excitingItems.any(
              (item) => modifiersListMatchesNew(item.modifiers, modifiers));
          if (isFound) {
            var existingItem = excitingItems.firstWhere(
              (item) => modifiersListMatchesNew(item.modifiers, modifiers),
            );
            existingItem.qty = existingItem.qty! + 1;
          } else {
            cartListItems.first.product!.add(
              CartProductModel(
                departmentUuid: '',
                categoryUuid: '',
                brandUuid: ' ',
                localId: 2,
                productTypeId: 1,
                weight: 0,
                groupUuid: '',
                uuid: productUUid,
                modifiers: modifiers,
                title: productname,
                singlePrice: singlePrice,
                taxType: taxtype,
                qty: quantity,
                tax: tax,
              ),
            );
          }
        }
      }
    }
    cartListItems.first.totalamount = cartListItems.fold(
      0,
      (previousValue, element) =>
          previousValue! +
          element.product!.fold(
            0,
            (previousValues, elements) =>
                previousValues + elements.totalPrice.toInt(),
          ),
    );

    refresh();
  }

  bool modifiersListMatches(List<CartProductModifier> existingModifiers,
      List<CartProductModifier> newModifiers) {
    if (existingModifiers.length != newModifiers.length) {
      return false;
    }

    for (var element in existingModifiers) {
      if (newModifiers
          .where((element1) => element1.uuid != element.uuid)
          .toList()
          .isEmpty) {
        return false;
      }
    }
    return true;
  }

  bool modifiersListMatchesNew(List<CartProductModifier> existingModifiers,
      List<CartProductModifier> newModifiers) {
    return existingModifiers.every((element) =>
        newModifiers.any((element1) => element1.uuid == element.uuid));
  }

  savepreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartlist');
    List<Map<String, dynamic>> cartListMap =
        cartListItems.map((cartModel) => cartModel.toMap()).toList();
    String cartListJson = jsonEncode(cartListMap);
    await prefs.setString('cartList', cartListJson);
  }

  updatingProductQuantity(
      productUUid, bool adding, BuildContext context) async {
    var excitingItems = cartListItems.first.product!
        .firstWhere((element) => element == productUUid);
    excitingItems.qty =
        adding == true ? excitingItems.qty! + 1 : excitingItems.qty! - 1;
    if (excitingItems.qty == 0) {
      cartListItems.first.product!.remove(excitingItems);
    }
    cartListItems.first.totalamount = cartListItems.fold(
        0,
        (previousValue, element) =>
            previousValue! +
            element.product!.fold(
                0,
                (previousValues, elements) =>
                    previousValues +
                    int.parse(elements.totalPrice.toString())));
    savepreferences();
    refresh();
  }

  updateTotalAmount(BuildContext context) async {
    cartListItems.first.totalamount = cartListItems.fold(
        0,
        (previousValue, element) =>
            previousValue! +
            element.product!.fold(
                0,
                (previousValues, elements) =>
                    previousValues +
                    int.parse(elements.totalPrice.toString())));
    savepreferences();
    refresh();
  }

  //

  List<Widget> getDashboardViewBodyScreen = [
    const HomePageMain(),
    const MenuPageScreen(),
    const ToolTipPage(),
    const PopularDishesPage(),
    const OffersPage(),
    const DealOfferPage(),
    const ServicesPage(),
    const GroceryItemsList(),
    const DealOfferPage2(),
    const ApplicationRefrencePage(),
    const AllFoodsDishesPages(),
    const SizedBox(height: 100),
    const MobileFooterPageView(
      selectedTabs: 'Home',
    ),
  ];

  List<Widget> getMobileViewBodyScreen = [
    const MobileHomePageMain(),
    const MobileMenuPageScreen(),
    const MobileToolTipPage(),
    const MobilePopularDishesPage(),
    const MobileOffersPage(),
    const MobileDealOfferPage(),
    const MobileApplicationRefrencePage(),
    const MobileAllFoodsDishesPages(),
    const MobileFooterPageView(
      selectedTabs: 'Home',
    ),
    Container(
      height: 70,
    )
  ];

  List<Widget> geShopPagesScreens = [
    const SHopPageMain(),
    const ShopPageBody(),
    const SizedBox(height: 100),
    const MobileFooterPageView(selectedTabs: 'Shop Page'),
  ];

  List<Widget> geShopPagesScreensMobile = [
    const MobileSHopPageMain(),
    const MobileShopPageBody(),
    const SizedBox(height: 100),
    const MobileFooterPageView(selectedTabs: 'Shop Page'),
  ];

  List<Widget> geMyAccountPagesScreens = [
    const MyAccountMain(),
    const MyAccountBody(),
    const SizedBox(height: 100),
    const MobileFooterPageView(selectedTabs: 'Shop Page'),
  ];

  List<Widget> getMyCartPagesScreens = [
    const MyCartMain(),
    const MyCartPageBody(),
    const SizedBox(height: 100),
    const MobileFooterPageView(selectedTabs: 'Shop Page'),
  ];
}

navigateNewScreen(BuildContext context, String pageName) {
  final controller = Provider.of<FoodEcommerceProvider>(context, listen: false);

  switch (pageName) {
    case 'My Account':
      context.go('/${controller.storeId}/my-account');
      break;
    case 'Home':
      context.go('/${controller.storeId}/home');
      break;
    case 'Shop Page':
      context.go('/${controller.storeId}/shop-page');
      break;
  }
}

class SelectedItem {
  final String parentGroupName;
  final String groupuuid;
  final ModifiersModel selectedItem;

  SelectedItem(this.parentGroupName, this.selectedItem, this.groupuuid);
}
