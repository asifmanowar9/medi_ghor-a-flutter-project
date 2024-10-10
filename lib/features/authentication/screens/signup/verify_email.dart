import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medi_ghor/common/widgets/success_screen/success_screen.dart';
import 'package:medi_ghor/features/authentication/controlllers/signup/verify_email_controller.dart';
import 'package:medi_ghor/features/authentication/screens/login/login.dart';
import 'package:medi_ghor/utils/constants/text_strings.dart';
import 'package:medi_ghor/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;


  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(VerifyEmailController());
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              ///image
              Image(
                image: const AssetImage(RImages.deliveredEmailIllustration),
                width: RHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: RSizes.spaceBtwSections,),

              ///title and subtitle
              Text(
                RTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwItems,),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwItems,),
              Text(
                RTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwSections,),

              ///buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() =>  SuccessScreen(
              image: RImages.staticSuccessIllustration,
              title: RTexts.yourAccountCreatedTitle,
              subTitle: RTexts.yourAccountCreatedSubTitle, onPressed: () => Get.to(()=> LoginScreen()),
            )),
                child: const Text(RTexts.tContinue)),
            ),
              const SizedBox(height: RSizes.spaceBtwItems,),
            SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(RTexts.resendEmail)),),


            ],
          ),
        ),
      ),
    );
  }
}
