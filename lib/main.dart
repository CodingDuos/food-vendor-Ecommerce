// ignore_for_file: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ecommerce/services/credientals.dart';
import 'package:food_ecommerce/services/deeplink.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'providers/dashboard_provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await Firebase.initializeApp(
      name: FirebaseCrediential.projectName,
      options: FirebaseCrediential().firebaseOptions);
  await Supabase.initialize(
    url: SupabaseCredentails.url,
    anonKey: SupabaseCredentails.anonKey,
  );
  runApp(const MyApp());
  //new pushed
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset('images/hero.png').image, context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FoodEcommerceProvider()),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ));
  }
}
