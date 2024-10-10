import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medi_ghor/features/authentication/screens/login/login.dart';
import 'package:medi_ghor/features/authentication/screens/onboarding/onboarding.dart';
import 'package:medi_ghor/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:medi_ghor/utils/exceptions/format_exceptions.dart';
import 'package:medi_ghor/utils/exceptions/platform_exceptions.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///function to relevant screen
  screenRedirect() async {
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  ///sign-in

  ///register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw RFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw RFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw RFormatException();
    } on PlatformException catch (e) {
      throw RPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again ';
    }
  }

  /// email verification
        Future<void> sendEmailVerification() async{
          try{
            await _auth.currentUser?.sendEmailVerification();
          }on FirebaseAuthException catch (e) {
            throw RFirebaseAuthException(e.code).message;
          } on FirebaseException catch (e) {
            throw RFirebaseException(e.code).message;
          } on FormatException catch (_) {
            throw RFormatException();
          } on PlatformException catch (e) {
            throw RPlatformException(e.code).message;
          } catch (e) {
            throw 'Something went wrong, Please try again ';
          }
        }


}
