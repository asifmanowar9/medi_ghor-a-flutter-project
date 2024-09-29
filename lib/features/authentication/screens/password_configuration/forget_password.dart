import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medi_ghor/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:medi_ghor/utils/constants/sizes.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
          padding: EdgeInsets.all( RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///headings
            Text(RTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: RSizes.spaceBtwItems,),
            Text(RTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: RSizes.spaceBtwSections * 2,),



            ///text feild
            TextFormField(
              decoration: const InputDecoration(labelText: RTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: RSizes.spaceBtwSections ,),

            ///buttons

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(RTexts.submit)),),
          ],
        ),
      ),
    );
  }
}
