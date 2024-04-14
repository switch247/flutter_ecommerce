import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/login.dart';
import 'package:t_store/features/authentication/screens/success_screen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../controllers/verify_email_controller.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear)),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.spaceBtwSections),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // image
              Image(
                image: AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              // title
              Text(TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              //
              SizedBox(height: TSizes.spaceBtwItems),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              SizedBox(height: TSizes.spaceBtwItems),
              //
              Text(TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              SizedBox(height: TSizes.spaceBtwSections),
              // buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // onPressed: () {},
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: Text(TTexts.tContinue),
                ),
              ),
              // signin
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  // onPressed: () {},
                  onPressed: () => controller.sendEmailVerification(),
                  child: Text(TTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
