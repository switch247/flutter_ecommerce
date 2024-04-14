import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoaders {
  static successSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        shouldIconPulse: true,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: Colors.white,
        ));
  }

  static void warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        shouldIconPulse: true,
        backgroundColor: Colors.orange,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: Colors.white,
        ));
  }

  static void errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        shouldIconPulse: true,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: Colors.white,
        ));
  }
}
