import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../data/repositories.authentication/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  /// Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);
// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
// Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
// Login user using EMail & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
// Remove Loader
      TFullScreenLoader.stopLoading();
// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
// googel signin authentication

  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);
// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // google auth

      final userCredentials =
          await AuthenticationRepository.instance.signinWithGoogle();

      // saveUserRecord

      await userController.saveUserRecord(userCredentials!);

      // stop loading
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
