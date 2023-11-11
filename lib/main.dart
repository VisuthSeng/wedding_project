import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wedding_project/app.dart';
import 'package:wedding_project/main_binding.dart';

import 'core/util/app_setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAHVlsKi3dotXuUI-wS80g0lg6slKqMK44",
      appId: "1:1047235649636:web:160c87de6b932530e53f71",
      messagingSenderId: "1047235649636",
      projectId: "wedding-thika-ba6f5",
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
