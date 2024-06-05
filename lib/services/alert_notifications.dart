import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

class AlertNotifications {
  static void showSnackBar(BuildContext context, String message) {
    ElegantNotification.error(
            title: const Text("Error"), description: Text(message))
        .show(context);
  }

  static void showAnimatedSnackBar(BuildContext context, String message) async {
    ElegantNotification.error(
            title: const Text("Error"), description: Text(message))
        .show(context);
  }
}
