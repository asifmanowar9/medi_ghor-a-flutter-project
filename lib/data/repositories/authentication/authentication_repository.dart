

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medi_ghor/features/authentication/screens/login/login.dart';
import 'package:medi_ghor/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


  ///variables
  final deviceStorage = GetStorage();



  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///function to relevant screen
    screenRedirect ()async{
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());

    }


}