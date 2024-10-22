import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medi_ghor/data/repositories/authentication/authentication_repository.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/helpers/network_manager.dart';
import 'package:medi_ghor/utils/popups/full_screen_loader.dart';
import 'package:medi_ghor/utils/popups/loaders.dart';

class LoginController extends GetxController {

  /// variables

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';  // Assign empty string if null
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';  // Assign empty string if null
    super.onInit();
  }


  /// login with email and password...

  Future<void> emailAndPasswordSignIn() async {
  try{
  //start loader
  RFullScreenLoader.openLoadingDialog("Logging you in....", RImages.animation4);

  final isConnected = await NetworkManager.instance.isConnected();
  if(!isConnected){
  RFullScreenLoader.stopLoading();
  return;
  }

  //form validation
  if(!loginFormKey.currentState!.validate()){
  RFullScreenLoader.stopLoading();
  return;
  }
  //save data if remember me is selected
  if(rememberMe.value){
    localStorage.write('REMEMBER_ME_EMAIL',email.text.trim());
    localStorage.write('REMEMBER_ME_PASSWORD',password.text.trim());
  }

  //login user with email and password
  final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

  //remove loader
    RFullScreenLoader.stopLoading();

    //redirect
    AuthenticationRepository.instance.screenRedirect();

  }catch (e){
    RFullScreenLoader.stopLoading();
    RLoaders.errorSnackBar(title: "Oh Snap...", message: e.toString());
  }
  }

}