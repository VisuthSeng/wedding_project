import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_project/presentation/screen/home/home_screen.dart';
import 'package:wedding_project/site_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      transitionDuration: const Duration(milliseconds: 200),
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      title: 'Thika & Daro',
      builder: (context, page) => SiteLayout(
        child: page!,
      ),
      initialRoute: '/', // Define the initial route
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
      ],
    );
  }
}
