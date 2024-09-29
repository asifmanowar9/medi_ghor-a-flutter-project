import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medi_ghor/common/widgets/login_signup/form_divider.dart';
import 'package:medi_ghor/common/widgets/login_signup/social_button.dart';
import 'package:medi_ghor/features/authentication/screens/signup/widgets/signup_form.dart';

import 'package:medi_ghor/utils/constants/sizes.dart';
import 'package:medi_ghor/utils/constants/text_strings.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ///title
              Text(
                RTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: RSizes.spaceBtwSections,
              ),

              ///form
              RSignupForm(),
              SizedBox(height: RSizes.spaceBtwSections,),
              ///divider
              RFormDivider(dividerText: RTexts.orSignInWith.capitalize!),
              SizedBox(height: RSizes.spaceBtwSections,),
              ///social buttons
              const RSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}


