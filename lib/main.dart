// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories.authentication/authentication/authentication_repository.dart';
import 'firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

// ...

Future<void> main() async {
  // add widgetsbinding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // init local storage getx
  await GetStorage.init();
  // await splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await payement methods
  // init Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  try {
    await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest,
    );
    print(
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    final appCheckDebugToken = await FirebaseAppCheck.instance.getToken(true);

    print('Debug Token: ${appCheckDebugToken}');
  } catch (e) {
    print(e.toString());
  }

  // await FirebaseAppCheck.instance.activate(
  //   // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   androidProvider: AndroidProvider.debug,
  //   appleProvider: AppleProvider.appAttest,
  // );
  // init authentication
  runApp(const App());
}
// 0f388c85-356f-42ef-8d37-bbdf0f26113c
// 0f388c85-356f-42ef-8d37-bbdf0f26113c
// web       1:1038375640500:web:5fd20c5eeeb8ecf64126e1
// android   1:1038375640500:android:55061266bef452ee4126e1
// ios       1:1038375640500:ios:cc39690d55bd21ad4126e1


// requestIntegrityToken(IntegrityTokenRequest{nonce=AajhqbVpjXcQ1B9vAHlsdiDcejLuwYhuIcVqLeLm9SWa-XphXigniHja92Swan9EePD9-T341cCygcGOTtX5zGa-LjUpaf6m62Xi9Xh7rIpMeBxR-SuPMR-rxtD3_7rzefbDL4K2d1IprJHeu6H555uIb06Jyj0GkLuiOmQ_yVcI8Yc=, cloudProjectNumber=1038375640500, network=null})