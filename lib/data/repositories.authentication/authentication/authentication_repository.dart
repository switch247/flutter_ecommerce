import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/features/authentication/screens/login.dart';
import 'package:t_store/features/authentication/screens/onboarding.dart';
import 'package:t_store/features/authentication/screens/verify_email.dart';
import 'package:t_store/main.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.off(() => VerifyScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // localstorage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  // [EmailAuthentication] LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

// [email auth] register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on TFirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TFormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw 'Something went wrong, try again';
      print(e);
    }
  }

// [re authentication]

// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

// [email authentication] forgot pass
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

// google auth
  Future<UserCredential?> signinWithGoogle() async {
    try {
      // triger authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      // obtain auth details from the request

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      // create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // once signed in return the user credentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
      throw 'Something went wrong. Please try again';
    }
  }

// facebook auth

/* sdfghjuakilsjfasdgkadg */

// [LogoutUser] -Valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
// [delete user]
}
