import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medi_ghor/features/authentication/screens/signup/verify_email.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class RSignupForm extends StatelessWidget {
  const RSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Form(
        child: Column(children: [
      Row(
        children: [
          Expanded(
            child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: RTexts.firstName, prefixIcon: Icon(Iconsax.user)),
            ),
          ),
          const SizedBox(
            width: RSizes.spaceBtwInputFields,
          ),
          Expanded(
            child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: RTexts.lastName, prefixIcon: Icon(Iconsax.user)),
            ),
          ),
        ],
      ),

      ///username
      const SizedBox(
        height: RSizes.spaceBtwInputFields,
      ),
      TextFormField(
        expands: false,
        decoration: const InputDecoration(
            labelText: RTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
      ),

      ///email
      const SizedBox(
        height: RSizes.spaceBtwInputFields,
      ),
      TextFormField(
        //expands: false,
        decoration: const InputDecoration(
            labelText: RTexts.email, prefixIcon: Icon(Iconsax.direct)),
      ),

      ///phone number
      const SizedBox(
        height: RSizes.spaceBtwInputFields,
      ),
      TextFormField(
        //expands: false,
        decoration: const InputDecoration(
            labelText: RTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
      ),

      ///password
      const SizedBox(
        height: RSizes.spaceBtwInputFields,
      ),
      TextFormField(
        // expands: false,
        obscureText: true,
        decoration: const InputDecoration(
            labelText: RTexts.password,
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye_slash)),
      ),
      const SizedBox(
        height: RSizes.spaceBtwSections,
      ),

      ///terms&conditions checkbox
      Row(
        children: [
          SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(value: true, onChanged: (value) {})),
          const SizedBox(
            width: RSizes.spaceBtwItems,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '${RTexts.iAgreeTo} ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: '${RTexts.privacyPolicy} ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? RColors.white : RColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                dark ? RColors.white : RColors.primary,
                          )),
                  TextSpan(
                      text: '${RTexts.and} ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: '${RTexts.termsOfUse}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? RColors.white : RColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                dark ? RColors.white : RColors.primary,
                          )),
                ],
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: RSizes.spaceBtwSections,
      ),

      ///signup button
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () => Get.to(() => const VerifyEmailScreen()),
            child: const Text(RTexts.createAccount)),
      )
    ]));
  }
}
