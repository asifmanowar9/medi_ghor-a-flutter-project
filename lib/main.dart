import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medi_ghor/utils/theme/theme.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {


  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );


  runApp(const App());
}


