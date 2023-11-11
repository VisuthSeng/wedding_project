import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wedding_project/app.dart';
import 'package:wedding_project/main_binding.dart';

import 'core/util/app_setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD01UO8PJQslFaAmqcmOtDYQt5RQpCq06M",
      appId: "1:708748129664:web:60646dbe485cea83697d65",
      messagingSenderId: "708748129664",
      projectId: "wedding-thika",
    ),
  );

  await Firebase.initializeApp();

//load all dependency
  _injectDepencies();

  runApp(const MyApp());
}

void _injectDepencies() {
  AppSetting.isLoading = true;
  MainBinding().dependencies();
  AppSetting.isLoading = false;
}
