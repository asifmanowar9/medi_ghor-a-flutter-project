import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medi_ghor/features/authentication/controlllers/login/login_controller.dart';
import 'package:medi_ghor/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:medi_ghor/features/authentication/screens/signup/signup.dart';
import 'package:medi_ghor/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class RLoginForm extends StatelessWidget {
  const RLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: RSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email input
            TextFormField(
              controller: controller.email,
              validator: (value) => RValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: RTexts.email,
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwInputFields),

            /// Password input
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => RValidator.validatePassword(value),
                // expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: RTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwInputFields / 2),

            /// Remember me & forget password
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                      ),
                      const Text(RTexts.rememberMe),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => ForgetPassword()),
                    child: const Text(RTexts.forgetPassword),
                  ),
                ],
              ),
            ),

            const SizedBox(height: RSizes.spaceBtwSections),

            /// Sign-in button...
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(RTexts.signIn),
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

            /// Create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(RTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
