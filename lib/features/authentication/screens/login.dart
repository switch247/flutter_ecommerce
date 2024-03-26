import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../navigation_menu.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../widgets/login_signup/FooterAuthentication.dart';
import '../../../widgets/login_signup/FormDivider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
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
              LoginLogoAndTitle(dark: dark),

              const FormLoginPage(),

              // divider
              FormDivider(dark: dark, dividerText: TTexts.orSignInWith),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              // footer
              const FooterAuthentication()
            ],
          ),
        ),
      ),
    );
  }
}

class LoginLogoAndTitle extends StatelessWidget {
  const LoginLogoAndTitle({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          height: 150,
          image: AssetImage(!dark ? TImages.darkAppLogo : TImages.lightAppLogo),
        ),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 10),
        Text(
          TTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class FormLoginPage extends StatelessWidget {
  const FormLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.diagram), labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            // password

            TextFormField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Iconsax.eye_slash),
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password),
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),
            // remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(ForgetPassword());
                  },
                  child: Text(TTexts.forgetPassword),
                ),
              ],
            ),
            // forget Password

            // signin
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(NavigationMenu());
                },
                child: Text(TTexts.signIn),
              ),
            ),
            // signup
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(SignUpScreen());
                },
                child: Text(TTexts.createAccount),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),
          ],
        ),
      ),
    );
  }
}
