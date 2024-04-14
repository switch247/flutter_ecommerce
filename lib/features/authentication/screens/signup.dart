import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/login.dart';
import 'package:t_store/features/authentication/screens/verify_email.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/validators/validation.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../widgets/login_signup/FooterAuthentication.dart';
import '../../../widgets/login_signup/FormDivider.dart';
import '../controllers/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: TSizes.defaultSpace, //appBarHeight
            left: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 10),
              // form
              SignUpForm(dark: dark),

              // divider
              FormDivider(dark: dark, dividerText: TTexts.orSignInWith),

              const SizedBox(height: TSizes.spaceBtwItems),

              // footer
              const FooterAuthentication()
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;
  final controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signupFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        TValidator.validateEmptyText('firstName', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TTexts.firstName),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        TValidator.validateEmptyText('lastName', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TTexts.lastName),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            // email
            TextFormField(
              controller: controller.userName,
              validator: (value) =>
                  TValidator.validateEmptyText('userName', value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: TTexts.username),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            // email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call), labelText: TTexts.phoneNo),
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            // password

            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: TTexts.password),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // terms and conditions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 24,
                        height: 24,
                        child: Obx(() => Checkbox(
                            value: controller.privacyPolicy.value,
                            onChanged: (value) => controller.privacyPolicy
                                .value = !controller.privacyPolicy.value))),
                    // const SizedBox(width: TSizes.spaceBtwItems),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: ' ${TTexts.iAgreeTo} ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                            text: '${TTexts.privacyPolicy} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                  color: dark ? TColors.white : TColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      dark ? TColors.white : TColors.primary,
                                ),
                          ),
                          TextSpan(
                              text: '${TTexts.and} ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                            text: '${TTexts.termsOfUse} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                  color: dark ? TColors.white : TColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      dark ? TColors.white : TColors.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // ceate acount
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signup();
                  // Get.to(VerifyScreen());
                },
                child: Text(TTexts.createAccount),
              ),
            ),
            // signin
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(LoginScreen());
                },
                child: Text(TTexts.signIn),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
