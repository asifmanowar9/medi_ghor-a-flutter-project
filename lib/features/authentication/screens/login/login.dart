import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_ghor/common/styles/spacing_styles.dart';
import 'package:medi_ghor/features/authentication/screens/login/widgets/login_form.dart';
import 'package:medi_ghor/features/authentication/screens/login/widgets/login_header.dart';
import 'package:medi_ghor/utils/constants/text_strings.dart';
import 'package:medi_ghor/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: RSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, title, subtitle
              RLoginHeader(dark: dark),

              /// Form
              RLoginForm(),

              /// Divider with text
              RFormDivider(dividerText: RTexts.orSignInWith.capitalize!,),
              const SizedBox(height: RSizes.spaceBtwSections),

              /// Footer (Social login buttons wrapped in SingleChildScrollView)
              RSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}







