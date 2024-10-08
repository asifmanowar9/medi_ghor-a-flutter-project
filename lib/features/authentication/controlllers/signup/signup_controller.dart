import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_ghor/data/repositories/authentication/authentication_repository.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/popups/full_screen_loader.dart';
import 'package:medi_ghor/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';


class SignupController extends GetxController{
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
    try{
      ///start loading
      RFullScreenLoader.openLoadingDialog('We are processing your information...', RImages.staticSuccessIllustration);

      ///check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
       // RFullScreenLoader.stopLoading();
        return;
      }
      ///form validation
      if(!signupFormKey.currentState!.validate()){
       // RFullScreenLoader.stopLoading();
        return;
      }
      ///privacyPolicy check
      if(!privacyPolicy.value){
        RLoaders.warningSnackBar(title: "Accept privacy policy.",
          message: 'In order to create account, you must read & accept the Privacy Policy & Terms of Use',
        );
        return;
      }

      ///register the user and authentication and save the data
       final user = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

    }
    catch(e){
      RLoaders.errorSnackBar(title: 'Ooohhhh Snap!', message: e.toString());

    }
    finally{
      RFullScreenLoader.stopLoading();
    }
  }

}