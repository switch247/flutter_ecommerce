import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login.dart';
import 'package:t_store/features/authentication/screens/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';
import '../../../utils/constants/sizes.dart';
import '../controllers/reset_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TTexts.forgetPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.start),
                SizedBox(height: TSizes.spaceBtwItems),
                Text(TTexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start),

                SizedBox(height: TSizes.spaceBtwSections),

                TextFormField(
                  controller: controller.email,
                  validator: TValidator.validateEmail,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      labelText: TTexts.email),
                ),

                SizedBox(height: TSizes.spaceBtwItems),
                //
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller
                        .sendPasswordResetEmail(controller.email.text.trim()),
                    // onPressed: () => Get.to(
                    //   () => ResetPassword(
                    //     image: TImages.deliveredEmailIllustration,
                    //     title: TTexts.changeYourPasswordTitle,
                    //     subTitle: TTexts.changeYourPasswordSubTitle,
                    //     onPressed: () => Get.to(
                    //       () => const LoginScreen(),
                    //     ),
                    //   ),
                    // ),
                    child: Text(TTexts.submit),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
