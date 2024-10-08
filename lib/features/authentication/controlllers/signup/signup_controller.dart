import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/popups/full_screen_loader.dart';
import 'package:medi_ghor/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';


class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  ///variables

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future <void> signup() async {
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


    }
    catch(e){
      RLoaders.errorSnackBar(title: 'Ooohhhh Snap!', message: e.toString());

    }
    finally{
      RFullScreenLoader.stopLoading();
    }
  }

}