import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medi_ghor/common/widgets/success_screen/success_screen.dart';
import 'package:medi_ghor/data/repositories/authentication/authentication_repository.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/constants/text_strings.dart';

import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      RLoaders.successSnackBar(
          title: 'Email sent!',
          message: 'Please check your inbox and verify the email.');
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Ohh Snap!', message: e.toString());
    }
  }

  ///set timer
  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
          image: RImages.animation3,
          title: RTexts.yourAccountCreatedTitle,
          subTitle: RTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect,
        ),
        );
      }
    });
  }
  ///manually check email verification
      checkEmailVerificationStatus(){
        final currentUser = FirebaseAuth.instance.currentUser;
        if(currentUser != null && currentUser.emailVerified){

        }
      }



}
