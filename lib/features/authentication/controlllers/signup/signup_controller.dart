import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_ghor/data/repositories/authentication/authentication_repository.dart';
import 'package:medi_ghor/data/repositories/user/user_repository.dart';
import 'package:medi_ghor/features/authentication/screens/signup/verify_email.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/popups/full_screen_loader.dart';
import 'package:medi_ghor/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      ///start loading
      RFullScreenLoader.openLoadingDialog(
          'We are processing your information...',
          RImages.staticSuccessIllustration);

      ///check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        RFullScreenLoader.stopLoading();
        return;
      }

      ///form validation
      if (!signupFormKey.currentState!.validate()) {
        RFullScreenLoader.stopLoading();
        return;
      }

      ///privacyPolicy check
      if (!privacyPolicy.value) {
        RLoaders.warningSnackBar(
          title: "Accept privacy policy.",
          message:
              'In order to create account, you must read & accept the Privacy Policy & Terms of Use',
        );
        return;
      }

      ///register the user and authentication and save the data using firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: userName.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      RFullScreenLoader.stopLoading();

      ///show success msg
      RLoaders.successSnackBar(
          title: 'Congratulation',
          message: 'Your account has been created! Verify email to continue');

      Get.to(() => VerifyEmailScreen());
    } catch (e) {
      RFullScreenLoader.stopLoading();

      RLoaders.errorSnackBar(title: 'Ohh Snap!', message: e.toString());
    }
  }
}
