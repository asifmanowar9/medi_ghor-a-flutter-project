import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medi_ghor/features/authentication/controlllers/signup/signup_controller.dart';
import 'package:medi_ghor/features/authentication/screens/signup/verify_email.dart';
import 'package:medi_ghor/utils/validators/validation.dart';

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
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
        child: Column(children: [
      Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller.firstName,
              validator: (value) =>  RValidator.validateEmptyText('First Name', value),
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
              controller: controller.lastName,
              validator: (value) =>  RValidator.validateEmptyText('Last Name', value),
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
        controller: controller.userName,
        validator: (value) =>  RValidator.validateEmptyText('UserName', value),
        expands: false,
        decoration: const InputDecoration(
            labelText: RTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
      ),

      ///email
      const SizedBox(
        height: RSizes.spaceBtwInputFields,
      ),
      TextFormField(
        controller: controller.email,
        validator: (value) =>  RValidator.validateEmail( value),
        //expands: false,
        decoration: const InputDecoration(
            labelText: RTexts.email, prefixIcon: Icon(Iconsax.direct)),
      ),

      ///phone number
      const SizedBox(
        height: RSizes.spaceBtwInputFields,
      ),
      TextFormField(
        controller: controller.phoneNumber,
        validator: (value) =>  RValidator.validatePhoneNumber( value),
        //expands: false,
        decoration: const InputDecoration(
            labelText: RTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
      ),

      ///password
      const SizedBox(
        height: RSizes.spaceBtwInputFields,
      ),
      Obx(
         () => TextFormField(
          controller: controller.password,
          validator: (value) =>  RValidator.validatePassword( value),
          // expands: false,
          obscureText: controller.hidePassword.value,
          decoration: InputDecoration(
              labelText: RTexts.password,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =!controller.hidePassword.value,
                  icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
              ),
          ),
        ),
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
              child: Obx(() => Checkbox(value: controller.privacyPolicy.value,
                  onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value ),
              ),
          ),
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
            onPressed: () => controller.signup(),
            child: const Text(RTexts.createAccount)),
      )
    ]));
  }
}
