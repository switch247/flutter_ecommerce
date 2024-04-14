import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import '../screens/login.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories.authentication/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/verify_email.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // load
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information', TImages.docerAnimation);
      // internet
      final isConected = await NetworkManager.instance.isConnected();
      if (!isConected) {
        return;
      }
      // form validate
      if (!signupFormKey.currentState!.validate()) {
        return;
      }
      // privacy
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In Order to create and account , you must read and accept the Privacy Policy & Terms of Use.');
        return;
      }
      //  add firebase register & save user data in firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        userName: userName.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());

      await userRepository.saveUserRecord(newUser);
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your account has been created! ');
      // move to verify screen
      await Get.offAll(() => VerifyScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
      return;
    }
  }
}
