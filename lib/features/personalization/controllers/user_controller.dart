import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/user/user_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';

import '../../../data/repositories.authentication/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Future<void> saveUserRecord(UserCredential userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? " ");
        final userName = UserModel.generateUsername(
            userCredentials.user!.displayName ?? " ");

        // map data
        final user = UserModel(
            id: userCredentials.user!.uid,
            userName: userName,
            email: userCredentials.user!.email ?? '',
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        // save user data
        await UserRepository.instance.saveUserRecord(user);
      }
    } catch (e) {
      print('=============================================================');
      print(e.toString());
      print('=============================================================');
      throw Error();
    }
  }
}
