import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/forget_password.dart';
import 'package:t_store/features/authentication/screens/reset_password.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../data/repositories.authentication/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
// Variables
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPAsswordFormKey = GlobalKey<FormState>();

  // final userController = Get.put(UserController());

  sendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing Your Request', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Email Sent', message: 'Email link sent Reset your Password');
      Get.to(() => ResetPassword(email: email));
    } catch (e) {
      return;
    }
  }
}
