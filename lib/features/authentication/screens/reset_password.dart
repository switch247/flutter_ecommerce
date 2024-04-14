import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:t_store/features/authentication/controllers/reset_password_controller.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword(
      {super.key,
      this.image = TImages.deliveredEmailIllustration,
      this.title = TTexts.changeYourPasswordTitle,
      this.subTitle = TTexts.changeYourPasswordSubTitle,
      this.onPressed,
      required this.email});
  final String email;
  final String image, title, subTitle;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(CupertinoIcons.clear)),
        ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Image(
                  image: AssetImage(image),
                  width: THelperFunctions.screenWidth() * 0.6,
                ),
                SizedBox(height: TSizes.spaceBtwSections),
                Text(title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                SizedBox(height: TSizes.spaceBtwItems),
                Text(subTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                SizedBox(height: TSizes.spaceBtwItems),
                //
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed, child: Text(TTexts.tContinue)),
                ),

                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      ForgetPasswordController.instance
                          .sendPasswordResetEmail(email);
                      // Get.to(LoginScreen());
                    },
                    child: Text(TTexts.resendEmail),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
