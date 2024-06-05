import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCredentails {
  static String url = 'https://oboeejxzmorurvvwocsd.supabase.co';
  static String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9ib2Vlanh6bW9ydXJ2dndvY3NkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODUwNzU1NTksImV4cCI6MjAwMDY1MTU1OX0.Q6IEwfg-ISOLOp9zptZ8wN2L0Oa1nG_wabUKpjMxi3M';
  static final supbaseClient = SupabaseClient(url, anonKey);
}

class SentryCredentails {
  static String url =
      'https://4f028fe12f913f7e488070f4a192a44c@o4505724548022272.ingest.sentry.io/4506716545024000';
}

class FirebaseCrediential {
  static String projectName = "ecommerce";
  static String apiKey = "AIzaSyA6noe6c1-9XFDnl18kwm9GomTNe5A3-Wo";
  static String authDomain = "food-ecomerce.firebaseapp.com";
  static String projectId = "food-ecomerce";
  static String storageBucket = 'food-ecomerce.appspot.com';
  static String messagingSenderId = "4515785644";
  static String appId = "1:4515785644:web:4409f4162095f3500ee809";
  static String measurementId = "G-X9EVR3R1N7";

  FirebaseOptions get firebaseOptions {
    return FirebaseOptions(
      apiKey: apiKey,
      authDomain: authDomain,
      projectId: projectId,
      storageBucket: storageBucket,
      messagingSenderId: messagingSenderId,
      appId: appId,
      measurementId: measurementId,
    );
  }
}
