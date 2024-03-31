import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/success_screen.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/appbar.dart';
import 'package:t_store/widgets/checkout/billing_address_section.dart';
import 'package:t_store/widgets/container/rounded_container.dart';
import 'package:t_store/widgets/product/cart/cart_item.dart';
import 'package:t_store/widgets/product/cart/cart_items.dart';

import '../../../utils/constants/colors.dart';
import '../../../widgets/checkout/billing_amount_section.dart';
import '../../../widgets/checkout/billing_payement_section.dart';
import '../../../widgets/cupon_widget.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Order Overview'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              // Coupon Text Field
              TCouponCode(dark: dark),
              const SizedBox(height: TSizes.spaceBtwItems),
              TRoundedContainer(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                showBorder: true,
                child: Column(
                  children: [
                    TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TBillingPayementSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payement Success',
                subTitle: 'Your item will be Shipped soon!',
                onPressed: () => Get.offAll(
                  () => const NavigationMenu(),
                ),
              )),
          child: Text('checkOut \$256.0'),
        ),
      ),
    );
  }
}
