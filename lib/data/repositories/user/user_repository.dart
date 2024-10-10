import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medi_ghor/features/personalization/models/user_model.dart';
import 'package:medi_ghor/utils/exceptions/format_exceptions.dart';
import 'package:medi_ghor/utils/exceptions/platform_exceptions.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  ///variables
  final FirebaseFirestore _db= FirebaseFirestore.instance;


  ///register
  Future<void> saveUserRecord (UserModel user) async {
    try{
      print('User data to save: ${user.toJson()}');  // Log user data
       await _db.collection('User').doc(user.id).set(user.toJson());
    } on FirebaseException catch(e){
      throw RFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw RFormatException();
    }on PlatformException catch(e){
      throw RPlatformException(e.code).message;
    }catch(e){
      print('Error saving user data: $e');  // Log errors
      throw 'Something went wrong, Please try again ';
    }

  }




}
